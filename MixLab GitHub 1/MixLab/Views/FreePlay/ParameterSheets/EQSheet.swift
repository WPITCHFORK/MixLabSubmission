//
//  EQSheet.swift
//  MixLab
//
//  Created by Will Pitchfork on 29/04/2023.
//

import SwiftUI
import Controls

struct EQSheet: View {
    @State private var EQSelected: Instrument? = nil
    
    private let EQChannel = [
        Instrument(name: "Kick"),
        Instrument(name: "OH"),
        Instrument(name: "Bass"),
        Instrument(name: "Guitar"),
        Instrument(name: "Keys"),
        Instrument(name: "Synth"),
        Instrument(name: "Vox 1"),
        Instrument(name: "Vox 2")
    ]
    
    var body: some View {
        ZStack {
            CustomPaleBlue
                .ignoresSafeArea()
            
            VStack {
                Text("EQ")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .foregroundColor(CustomBlue)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(CustomBlue)
                    .frame(height: 5)
                    .padding(.horizontal, 30)
                
                HStack {
                    ForEach(EQChannel) { instrument in
                        Spacer()
                        Button(instrument.name) {
                            EQSelected = instrument
                        }
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(CustomBlue)
                    }
                    Spacer()
                }
                .padding(.vertical, 10)
                
                Spacer()
                
                switch EQSelected?.name {
                    case "Kick":
                        Text("KICK EQ")
                    case "OH":
                        Text("OH EQ")
                    case "Bass":
                        Text("Bass EQ")
                    case "Guitar":
                        Text("Guitar EQ")
                    case "Keys":
                        Text("Keys EQ")
                    case "Synth":
                        Text("Synth EQ")
                    case "Vox 1":
                        Text("Vox 1 EQ")
                    case "Vox 2":
                        Text("Vox 2 EQ")
                    default:
                        Text("KICK EQ")
                }
            }
        }
    }
}

struct EQSheet_Previews: PreviewProvider {
    static var previews: some View {
        EQSheet()
    }
}


struct KickEQ: View {
    var body: some View {
        VStack {
            
        }
    }
}
