//
//  RoomSheet.swift
//  MixLab
//
//  Created by Will Pitchfork on 11/05/2023.
//

import SwiftUI
import SoundpipeAudioKit

struct RoomSheet: View {
    @EnvironmentObject var conductor: MixerClass
    
    var body: some View {
        ZStack {
            CustomPaleBlue
                .ignoresSafeArea()
            
            VStack {
                Text("Room Response")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .foregroundColor(CustomBlue)
                
                Text("Please select which room you'd like to mix in!")
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(CustomBlue)
                    .frame(height: 5)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        print("NCEM selected")
                        conductor.selectedRoom = "NCEM"
                    }) {
                        VStack {
                            Image("NCEM")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding(.horizontal, 50)
                            Text("National Center for Early Music")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(CustomBlue)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                        }
                    }
                    Spacer()
                    
                    VStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 400, height: 5)
                            .foregroundColor(CustomBlue)
                        
                        Text("MORE ROOMS COMING SOON!")
                            .font(.largeTitle)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                        
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 400, height: 5)
                            .foregroundColor(CustomBlue)
                    }
                    .rotationEffect(.degrees(-10))
                    Spacer()
                    
                }
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct RoomSheet_Previews: PreviewProvider {
    static var previews: some View {
        RoomSheet()
    }
}
