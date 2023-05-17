//
//  BandView.swift
//  MixLab
//
//  Created by Will Pitchfork on 16/04/2023.
//

import SwiftUI

struct BandView: View {
    var body: some View {
        HStack {
            Spacer()
            Image("FOH")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height * 0.25)
            
            Spacer()
            Image("Band")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 10.0)
                .frame(height: UIScreen.main.bounds.height*0.25)
            
            Spacer()
            Image("FOH")
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.height * 0.25)
            Spacer()
        }
    }
}

struct BandView_Previews: PreviewProvider {
    static var previews: some View {
        BandView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
