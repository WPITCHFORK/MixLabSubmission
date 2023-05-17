//
//  MixerView.swift
//  MixLab
//
//  Created by Will Pitchfork on 16/04/2023.
//

import SwiftUI

struct MixerView: View {
    @EnvironmentObject var conductor: MixerClass
    
    @State private var selectedParameter: Parameter? = nil
    
    let parameters = [
        Parameter(name: "Gain"),
        Parameter(name: "Pan"),
        Parameter(name: "EQ"),
        Parameter(name: "Compression"),
        Parameter(name: "Reverb"),
        Parameter(name: "Room")
    ]
    
    var body: some View {
        HStack {
            Spacer()
            
            let channels = ["Kick", "OH", "Bass", "Guitar", "Keys", "Synth", "Vox 1", "Vox 2"]
            
            ForEach(0..<8) { i in
                VStack {
                    FaderView(channelName: channels[i], channelValue: $conductor.tracks[i].volume)
                    
                    Button(action: {
                        if conductor.mutes[i] == false {
                            conductor.preMute[i] = conductor.tracks[i].volume
                            conductor.tracks[i].volume = 0
                            conductor.muteColors[i] = CustomRed
                        } else {
                            conductor.tracks[i].volume = conductor.preMute[i]
                            conductor.muteColors[i] = CustomGreen
                        }
                        conductor.mutes[i].toggle()
                    }) {
                        Image(systemName: "speaker.slash.fill")
                            .font(.title3)
                            .foregroundColor(conductor.muteColors[i])
                            .fontWeight(.bold)
                            .padding()
                            .border(conductor.muteColors[i], width: 4)
                    }
                }
            }
            
            Spacer()
            
            VStack {
                ForEach(parameters) { title in
                    Button(title.name) {
                        selectedParameter = title
                    }
                    .buttonStyle(parameterSelectionButton())
                }
            }
            .sheet(item: $selectedParameter) { parameter in
                switch parameter.name {
                    case "Gain":
                        GainSheet()
                    case "Pan":
                        PanSheet()
                    case "EQ":
                        ComingSoon()
//                        EQSheet()
                    case "Compression":
                        //Text("Compression Sheet")
                        ComingSoon()
                    case "Reverb":
                        //Text("Reverb Sheet")
                        ComingSoon()
                    case "Room":
                        //Text("Room Sheet")
                        RoomSheet()
                            .environmentObject(MixerClass())
                    default:
                        //EmptyView()
                        ComingSoon()
                }
            }
            
            Spacer()
            
            VStack {
                FaderView(channelName: "Main LR", channelValue: $conductor.master.volume)
                
                Button(action: {
                    if conductor.masterMute == false {
                        conductor.masterPreMute = conductor.master.volume
                        conductor.master.volume = 0
                        conductor.masterMuteColor = CustomRed
                    } else {
                        conductor.master.volume = conductor.masterPreMute
                        conductor.masterMuteColor = CustomGreen
                    }
                    conductor.masterMute.toggle()
                }) {
                    Image(systemName: "speaker.slash.fill")
                        .font(.title3)
                        .foregroundColor(conductor.masterMuteColor)
                        .fontWeight(.bold)
                        .padding()
                        .border(conductor.masterMuteColor, width: 4)
                }
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            conductor.master.volume = 1.2
        }
    }
}

struct Parameter: Identifiable {
    let id = UUID()
    let name: String
}

struct MixerView_Previews: PreviewProvider {
    static var previews: some View {
        MixerView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(MixerClass())
    }
}
