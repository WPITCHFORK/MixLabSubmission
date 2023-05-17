//
//  FreePlayButton.swift
//  MixLab
//
//  Created by Will Pitchfork on 14/03/2023.
//

import SwiftUI

struct FreePlayButton: View {
    @EnvironmentObject var conductor: MixerClass
    
    var body: some View {
        Button (action: { }) {
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .aspectRatio(1.0, contentMode: ContentMode.fit)
                    .foregroundColor(CustomLightBlue)
                
                NavigationLink(destination: MainMixerView()) {
                    VStack {
                        Image(systemName: "slider.vertical.3")
                            .font(.system(size: 200))
                            .foregroundColor(CustomBlue)
                        Text("Free Play")
                            .font(.system(size: 50))
                            .foregroundColor(CustomBlue)
                            .fontWeight(.heavy)
                    }
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct FreePlayButton_Previews: PreviewProvider {
    static var previews: some View {
        FreePlayButton()
            .environmentObject(MixerClass())
    }
}
