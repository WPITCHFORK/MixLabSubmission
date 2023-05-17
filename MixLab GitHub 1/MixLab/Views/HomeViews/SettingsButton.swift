//
//  SettingsButton.swift
//  MixLab
//
//  Created by Will Pitchfork on 14/03/2023.
//

import SwiftUI

struct SettingsButton: View {
    var body: some View {
        Button (action: { }) {
            ZStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .aspectRatio(1.0, contentMode: ContentMode.fit)
                        .foregroundColor(CustomLightBlue)
                
                NavigationLink(destination: SettingsView()) {
//                NavigationLink(destination: ComingSoon()) {
                    VStack {
                        Image(systemName: "gearshape.2.fill")
                            .font(.system(size: 200))
                            .foregroundColor(CustomBlue)
                        Text("Settings")
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

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton()
    }
}
