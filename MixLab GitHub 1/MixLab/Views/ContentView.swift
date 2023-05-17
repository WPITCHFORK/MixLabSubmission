//
//  ContentView.swift
//  MixLab
//
//  Created by Will Pitchfork on 12/03/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var conductor: MixerClass
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomBlue
                    .ignoresSafeArea()
            
                VStack {
                    Text("Home")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Grid{
                        GridRow{
                            LessonsButton()
                                .padding(.horizontal, 20)
                            FreePlayButton()
                                .padding(.horizontal, 20)
                        }
                        GridRow{
                            GamesButton()
                                .padding(.horizontal, 20)
                            SettingsButton()
                                .padding(.horizontal, 20)
                        }
                    }
                    
                }
                .padding(.top, 20)
            }
            
            .navigationBarTitle("Home")
            .navigationBarHidden(true)
        }
        .scrollContentBackground(.hidden)
        .statusBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(MixerClass())
    }
}
