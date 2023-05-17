//
//  ButtonStyles.swift
//  MixLab
//
//  Created by Will Pitchfork on 16/04/2023.
//

import Foundation
import SwiftUI

struct parameterSelectionButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .foregroundColor(CustomGreen)
            .font(.system(size:20))
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.14)
            .border(Color.accentColor, width: 4)
    }
}

struct channelSelectionButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(CustomGreen)
            .fontWeight(.bold)
            .font(.system(size:18))
            .padding(.vertical, 7)
            .frame(width: UIScreen.main.bounds.width * 0.08)
            .border(CustomGreen, width: 3)
    }
}
