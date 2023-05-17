//
//  GainSheet.swift
//  MixLab
//
//  Created by Will Pitchfork on 24/04/2023.
//

import SwiftUI
import AudioKit
import AudioKitUI
import AudioKitEX

struct GainSheet: View {
    @EnvironmentObject var conductor: MixerClass
    
    var linGrad: LinearGradient = LinearGradient(gradient: Gradient(colors: [CustomRed, CustomRed, CustomYellow, CustomGreen, CustomBlue]),
                                                 startPoint: .top,
                                                 endPoint: .bottom)
    
    var body: some View {
        ZStack {
            CustomPaleBlue
                .ignoresSafeArea()
            
            VStack {
                Text("Gain")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .foregroundColor(CustomBlue)
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(CustomBlue)
                    .frame(height: 5)
                    .padding(.horizontal, 30)
                
                VStack {
                    // Sliders
                    GainSliders()
                    
                    // Meters
                    HStack {
                        VStack {
                            FFTView(conductor.channel1OUT!, linearGradient: linGrad, barCount: 1, maxAmplitude: -25, minAmplitude: -150.0)
                            ZStack {
                                Text("Kick")
                                    .foregroundColor(CustomBlue)
                            }
                            .padding(.horizontal, 21)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(CustomBlue, lineWidth: 2)
                            )
                        }
                        
                        VStack {
                            FFTView(conductor.channel2OUT!, linearGradient: linGrad, barCount: 1, maxAmplitude: -25, minAmplitude: -150.0)
                            ZStack {
                                Text("OH")
                                    .foregroundColor(CustomBlue)
                            }
                            .padding(.horizontal, 24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(CustomBlue, lineWidth: 2)
                            )
                        }
                        
                        VStack {
                            FFTView(conductor.channel3OUT!, linearGradient: linGrad, barCount: 1, maxAmplitude: -25, minAmplitude: -150.0)
                            ZStack {
                                Text("Bass")
                                    .foregroundColor(CustomBlue)
                            }
                            .padding(.horizontal, 19)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(CustomBlue, lineWidth: 2)
                            )
                        }
                        
                        VStack {
                            FFTView(conductor.channel4OUT!, linearGradient: linGrad, barCount: 1, maxAmplitude: -25, minAmplitude: -150.0)
                            ZStack {
                                Text("Guitar")
                                    .foregroundColor(CustomBlue)
                            }
                            .padding(.horizontal, 14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(CustomBlue, lineWidth: 2)
                            )
                        }
                        
                        VStack {
                            FFTView(conductor.channel5OUT!, linearGradient: linGrad, barCount: 1, maxAmplitude: -25, minAmplitude: -150.0)
                            ZStack {
                                Text("Keys")
                                    .foregroundColor(CustomBlue)
                            }
                            .padding(.horizontal, 19)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(CustomBlue, lineWidth: 2)
                            )
                        }
                        
                        VStack {
                            FFTView(conductor.channel6OUT!, linearGradient: linGrad, barCount: 1, maxAmplitude: -25, minAmplitude: -150.0)
                            ZStack {
                                Text("Synth")
                                    .foregroundColor(CustomBlue)
                            }
                            .padding(.horizontal, 15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(CustomBlue, lineWidth: 2)
                            )
                        }
                        
                        VStack {
                            FFTView(conductor.channel7OUT!, linearGradient: linGrad, barCount: 1, maxAmplitude: -25, minAmplitude: -150.0)
                            ZStack {
                                Text("Vox 1")
                                    .foregroundColor(CustomBlue)
                            }
                            .padding(.horizontal, 18)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(CustomBlue, lineWidth: 2)
                            )
                        }
                        
                        VStack {
                            FFTView(conductor.channel8OUT!, linearGradient: linGrad, barCount: 1, maxAmplitude: -25, minAmplitude: -150.0)
                            ZStack {
                                Text("Vox 2")
                                    .foregroundColor(CustomBlue)
                            }
                            .padding(.horizontal, 16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(CustomBlue, lineWidth: 2)
                            )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
                }
            }
        }
    }
}

//struct GainSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        GainSliders()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}


struct GainSliders: View {
    @EnvironmentObject var conductor: MixerClass
    @State private var kickdB: AUValue = 0.0
    @State private var OHdB: AUValue = 0.0
    @State private var BassdB: AUValue = 0.0
    @State private var GuitardB: AUValue = 0.0
    @State private var KeysdB: AUValue = 0.0
    @State private var SynthdB: AUValue = 0.0
    @State private var Vox1dB: AUValue = 0.0
    @State private var Vox2dB: AUValue = 0.0
    
    let channels = ["Kick", "OH", "Bass", "Guitar", "Keys", "Synth", "Vox 1", "Vox 2"]
    
    var body: some View {
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
                SliderView(sliderValue: $kickdB, fader: $conductor.channel1)
                    .padding(.vertical, 5)
                SliderView(sliderValue: $OHdB, fader: $conductor.channel2)
                    .padding(.vertical, 5)
                SliderView(sliderValue: $BassdB, fader: $conductor.channel3)
                    .padding(.vertical, 5)
                SliderView(sliderValue: $GuitardB, fader: $conductor.channel4)
                    .padding(.vertical, 5)
                SliderView(sliderValue: $KeysdB, fader: $conductor.channel5)
                    .padding(.vertical, 5)
                SliderView(sliderValue: $SynthdB, fader: $conductor.channel6)
                    .padding(.vertical, 5)
                SliderView(sliderValue: $Vox1dB, fader: $conductor.channel7)
                    .padding(.vertical, 5)
                SliderView(sliderValue: $Vox2dB, fader: $conductor.channel8)
                    .padding(.vertical, 5)
            }
            
            Spacer()
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: AUValue
    @Binding var fader: Fader?
    
    var body: some View {
        Slider(value: $sliderValue, in: -60...30)
            .tint(CustomBlue)
            .onChange(of: sliderValue) { value in
                fader?.dB = AUValue(value)
            }
    }
}
