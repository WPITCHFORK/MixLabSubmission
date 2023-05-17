//
//  PanSheet.swift
//  MixLab
//
//  Created by Will Pitchfork on 29/04/2023.
//

import SwiftUI
import AudioKit
import AudioKitEX

struct PanSheet: View {
    @EnvironmentObject var conductor: MixerClass
    
    let channels = ["Kick", "OH", "Bass", "Guitar", "Keys", "Synth", "Vox 1", "Vox 2"]
    
    var body: some View {
        ZStack {
            CustomPaleBlue
                .ignoresSafeArea()
            
            VStack {
                Text("Pan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .foregroundColor(CustomBlue)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(CustomBlue)
                    .frame(height: 5)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        ForEach(channels, id: \.self) { title in
                            Text(title)
                                .foregroundColor(CustomBlue)
                                .fontWeight(.bold)
                                .padding(.vertical, 10)
                                .frame(width: UIScreen.main.bounds.width * 0.2, alignment: .center)
                        }
                    }
                    
                    Spacer()
                    VStack {
                        Slider(value: $conductor.fader1IN.pan, in: -1 ... 1)
                        {
                            Text("Kick Pan")
                        } minimumValueLabel: {
                            Text("Left")
                        } maximumValueLabel: {
                            Text("Right")
                        }
                        .tint(CustomBlue)
                        .padding(.vertical, 5)
                        
                        Slider(value: $conductor.fader2IN.pan, in: -1 ... 1)
                        {
                            Text("OH Pan")
                        } minimumValueLabel: {
                            Text("Left")
                        } maximumValueLabel: {
                            Text("Right")
                        }
                        .tint(CustomBlue)
                        .padding(.vertical, 5)
                        
                        Slider(value: $conductor.fader3IN.pan, in: -1 ... 1)
                        {
                            Text("Bass Pan")
                        } minimumValueLabel: {
                            Text("Left")
                        } maximumValueLabel: {
                            Text("Right")
                        }
                        .tint(CustomBlue)
                        .padding(.vertical, 5)
                        
                        Slider(value: $conductor.fader4IN.pan, in: -1 ... 1)
                        {
                            Text("Guitar Pan")
                        } minimumValueLabel: {
                            Text("Left")
                        } maximumValueLabel: {
                            Text("Right")
                        }
                        .tint(CustomBlue)
                        .padding(.vertical, 5)
                        
                        Slider(value: $conductor.fader5IN.pan, in: -1 ... 1)
                        {
                            Text("Keys Pan")
                        } minimumValueLabel: {
                            Text("Left")
                        } maximumValueLabel: {
                            Text("Right")
                        }
                        .tint(CustomBlue)
                        .padding(.vertical, 5)
                        
                        Slider(value: $conductor.fader6IN.pan, in: -1 ... 1)
                        {
                            Text("Synth Pan")
                        } minimumValueLabel: {
                            Text("Left")
                        } maximumValueLabel: {
                            Text("Right")
                        }
                        .tint(CustomBlue)
                        .padding(.vertical, 5)
                        
                        Slider(value: $conductor.fader7IN.pan, in: -1 ... 1)
                        {
                            Text("Vox 1 Pan")
                        } minimumValueLabel: {
                            Text("Left")
                        } maximumValueLabel: {
                            Text("Right")
                        }
                        .tint(CustomBlue)
                        .padding(.vertical, 5)
                        
                        Slider(value: $conductor.fader8IN.pan, in: -1 ... 1)
                        {
                            Text("Vox 2 Pan")
                        } minimumValueLabel: {
                            Text("Left")
                        } maximumValueLabel: {
                            Text("Right")
                        }
                        .tint(CustomBlue)
                        .padding(.vertical, 5)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                
                Spacer()
            }
        }
    }
}

struct PanSheet_Previews: PreviewProvider {
    static var previews: some View {
        PanSheet()
    }
}
