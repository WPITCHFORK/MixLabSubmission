//
//  InstrumentSelectView.swift
//  MixLab
//
//  Created by Will Pitchfork on 16/04/2023.
//

import SwiftUI

struct InstrumentSelectView: View {
    @State private var selectedInstrument: Instrument? = nil
    
    let instruments = [
        Instrument(name: "Keys"),
        Instrument(name: "Synth"),
        Instrument(name: "Guitar"),
        Instrument(name: "Drums"),
        Instrument(name: "Vocals"),
        Instrument(name: "Bass")
    ]
    
    var body: some View {
        HStack {
            ForEach(instruments) { instrument in
                Spacer()
                Button(instrument.name) {
                    selectedInstrument = instrument
                }
                .buttonStyle(InstrumentSelectionButton())
            }
            Spacer()
        }
        .sheet(item: $selectedInstrument) { instrument in
            switch instrument.name {
            case "Keys":
                //Text("Keys Sheet")
                    ComingSoon()
            case "Synth":
//                Text("Synth Sheet")
                    ComingSoon()
            case "Guitar":
//                GuitarSheet()
                    ComingSoon()
            case "Drums":
//                Text("Drums Sheet")
                    ComingSoon()
            case "Vocals":
//                Text("Vocals Sheet")
                    ComingSoon()
            case "Bass":
//                BassSheet()
                    ComingSoon()
            default:
//                EmptyView()
                    ComingSoon()
            }
        }
    }
}

struct Instrument: Identifiable {
    let id = UUID()
    let name: String
}

struct InstrumentSelectionButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .fontWeight(.semibold)
            .font(.title2)
            .foregroundColor(CustomYellow)
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.14)
            .background(CustomBlue)
            .cornerRadius(15)
    }
}

struct InstrumentSelectView_Previews: PreviewProvider {
    static var previews: some View {
        InstrumentSelectView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
