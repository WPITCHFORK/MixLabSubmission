//
//  ComingSoon.swift
//  MixLab
//
//  Created by Will Pitchfork on 03/05/2023.
//

import SwiftUI

struct ComingSoon: View {
    var body: some View {
        ZStack {
            CustomLightBlue
                .ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 400, height: 5)
                    .foregroundColor(CustomBlue)
                
                Text("COMING SOON!")
                    .font(.largeTitle)
                    .foregroundColor(CustomBlue)
                    .fontWeight(.bold)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 400, height: 5)
                    .foregroundColor(CustomBlue)
            }
            .rotationEffect(.degrees(-10))
        }
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon()
    }
}
