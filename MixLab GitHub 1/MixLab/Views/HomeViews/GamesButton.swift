//
//  GamesButton.swift
//  MixLab
//
//  Created by Will Pitchfork on 30/03/2023.
//

import SwiftUI

struct GamesButton: View {
    var body: some View {
        Button (action: { }) {
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .aspectRatio(1.0, contentMode: ContentMode.fit)
                    .foregroundColor(CustomLightBlue)
                
                NavigationLink(destination: Game1()) {
//                NavigationLink(destination: ComingSoon()) {
                    VStack {
                        Image(systemName: "gamecontroller.fill")
                            .font(.system(size: 175))
                            .frame(height: 225)
                            .foregroundColor(CustomBlue)
                        Text("Games")
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

struct GamesButton_Previews: PreviewProvider {
    static var previews: some View {
        GamesButton()
    }
}
