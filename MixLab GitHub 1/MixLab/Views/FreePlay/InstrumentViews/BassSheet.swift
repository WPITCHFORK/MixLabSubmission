//
//  BassSheet.swift
//  MixLab
//
//  Created by Will Pitchfork on 18/04/2023.
//

import SwiftUI
import AudioKit

struct BassSheet: View {
    @State var gain: AUValue = 0.7
    @State var pan: AUValue = 0.5
    @State var low: AUValue = 0.5
    @State var lomid: AUValue = 0.5
    @State var himid: AUValue = 0.5
    @State var high: AUValue = 0.5
    
    var body: some View {
        
        ZStack {
            CustomPaleBlue
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("Bass Guitar")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(CustomBlue)
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Gain")
                            .font(.title3)
                            .font(.title3)
                            .foregroundColor(CustomBlue)
                        Spacer()
                        Slider(value: $gain, in: 0...1)
                            .frame(width: UIScreen.main.bounds.width * 0.4)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Pan")
                            .font(.title3)
                            .foregroundColor(CustomBlue)
                        Spacer()
                        Slider(value: $pan, in: 0...1)
                            .frame(width: UIScreen.main.bounds.width * 0.4)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Low")
                            .font(.title3)
                            .foregroundColor(CustomBlue)
                        Spacer()
                        Slider(value: $low, in: 0...1)
                            .frame(width: UIScreen.main.bounds.width * 0.4)
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Low Mid")
                            .font(.title3)
                            .foregroundColor(CustomBlue)
                        Spacer()
                        Slider(value: $lomid, in: 0...1)
                            .frame(width: UIScreen.main.bounds.width * 0.4)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text("High Mid")
                            .font(.title3)
                            .foregroundColor(CustomBlue)
                        Spacer()
                        Slider(value: $himid, in: 0...1)
                            .frame(width: UIScreen.main.bounds.width * 0.4)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Text("High")
                            .font(.title3)
                            .foregroundColor(CustomBlue)
                        Spacer()
                        Slider(value: $high, in: 0...1)
                            .frame(width: UIScreen.main.bounds.width * 0.4)
                        Spacer()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct BassSheet_Previews: PreviewProvider {
    static var previews: some View {
        BassSheet()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
