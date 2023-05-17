//
//  MixerView.swift
//  MixLab
//
//  Created by Will Pitchfork on 15/04/2023.
//

import SwiftUI

struct MainMixerView: View {
    @EnvironmentObject var conductor: MixerClass
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomPaleBlue.ignoresSafeArea()
                
                VStack {
                    BandView()
                    
                    InstrumentSelectView()
                    
                    MixerView()
                        .environmentObject(conductor)
                }
                .padding(.bottom, -20)
            }
            .toolbar {
                Button(action: {
                    playPause()
                }) {
                    Image(systemName: "play.fill")
                }
            }
            .onDisappear {
                let allTracks = [conductor.track1, conductor.track2, conductor.track3, conductor.track4, conductor.track5, conductor.track6, conductor.track7, conductor.track8]
                
                for players in allTracks {
                    players.stop()
                }
            }
        }
    }
    
    
    func playPause() {
        let allTracks = [conductor.track1, conductor.track2, conductor.track3, conductor.track4, conductor.track5, conductor.track6, conductor.track7, conductor.track8]
        
        if conductor.track1.isPlaying {
            for players in allTracks {
                players.pause()
            }
        } else {
            for players in allTracks {
                players.play()
            }
        }
    }
}



struct MainMixerView_Previews: PreviewProvider {
    static var previews: some View {
        MainMixerView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject(MixerClass())
    }
}
