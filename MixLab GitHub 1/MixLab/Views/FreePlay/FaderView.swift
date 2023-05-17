//
//  FaderView.swift
//  MixLab
//
//  Created by Will Pitchfork on 16/04/2023.
//

import SwiftUI
import AudioKit

struct FaderView: View {
    @EnvironmentObject var conductor: MixerClass
    let channelName: String
    var channelValue: Binding<AUValue>
    
    var body: some View {
        VStack {
            Button(action: {
                print("Channel Selected: \(channelName)")
            }) {
                Text(channelName)
            }
            .buttonStyle(channelSelectionButton())
            
            Image("FaderBackground")
                .resizable()
                .scaledToFit()
                .overlay {
                    // Input value is 0 to 3
                    DecibelFader(decibelValue: channelValue)
                        .padding()
                        .frame(width: UIScreen.main.bounds.height * 0.4)
                        .rotationEffect(.degrees(-90.0), anchor: .center)
                }
        }
    }
}

struct DecibelFader: View {
    @Binding var decibelValue: AUValue
    
    var body: some View {
        Slider(value: Binding(get: { linearToDecibel(value: decibelValue) }, set: { decibelValue = decibelToLinear(value: $0) }
                             ), in: -40.0...10) // -60db to +20db
        .tint(Color.white)
    }
    
    func linearToDecibel(value: AUValue) -> AUValue {
        return 20.0 * log10(value)
    }
    
    func decibelToLinear(value: AUValue) -> AUValue {
        return pow(10.0, value / 20.0)
    }
}
