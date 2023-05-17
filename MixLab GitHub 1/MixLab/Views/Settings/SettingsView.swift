//
//  SettingsView.swift
//  MixLab
//
//  Created by Will Pitchfork on 14/03/2023.
//

import SwiftUI

struct SettingsView: View {
    @State var selection = 1
    
    var body: some View {
        NavigationSplitView {
            ZStack{
            CustomLightBlue
                    .ignoresSafeArea()
                
                List {
                    Button(action: {
                        selection = 1
                    }) {
                        Text("Setting 1")
                    }
                    
                    Button(action: {
                        selection = 2
                    }) {
                        Text("Setting 2")
                    }
                    
                    Button(action: {
                        selection = 3
                    }) {
                        Text("About")
                    }
                    
                }
            }
        } detail: {
            ZStack {
                CustomPaleBlue
                    .ignoresSafeArea()
                
                if selection == 1 {
                    Text("Details 1")
                } else if selection == 2 {
                    Text("Details 2")
                } else if selection == 3 {
                    VStack {
                        Spacer()
                        Text("About MixLab")
                            .font(.largeTitle)
                        Spacer()
                        Text("MixLab has been created as part of an MEng Project by Will Pitchfork, studying for a Master in Electronic Engineering with Music Technology Systems.")
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
            }
        }

        
        .navigationTitle(Text("Settings"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
