//
//  LessonAudioEngine.swift
//  MixLab
//
//  Created by Will Pitchfork on 02/05/2023.
//

import Foundation
import AudioKit
import AVFoundation
import SwiftUI
import AudioKitEX

final class LessonAudioEngine: ObservableObject {
    let LessonEngine = AudioEngine()
    
    @Published var RUMine = AudioPlayer()
    @Published var HDN = AudioPlayer()
    @Published var BoRhap = AudioPlayer()
    @Published var SLTS = AudioPlayer()
    @Published var LessonMixer = Mixer()
    @Published var September = AudioPlayer()
    
    init() {
        LessonMixer = Mixer(RUMine, HDN, BoRhap, SLTS, September)
        
        loadLessonFile(track: RUMine, fileName: "Samples/LessonTracks/RUMine")
        loadLessonFile(track: HDN, fileName: "Samples/LessonTracks/HardDaysNight")
        loadLessonFile(track: BoRhap, fileName: "Samples/LessonTracks/BoRhap")
        loadLessonFile(track: SLTS, fileName: "Samples/LessonTracks/SLTS")
        loadLessonFile(track: September, fileName: "Samples/LessonTracks/September")
        
        LessonEngine.output = LessonMixer
        try? LessonEngine.start()
    }
    
    func loadLessonFile(track: AudioPlayer, fileName: String) {
        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: "wav") {
                try track.load(url: file)
            } else {
                Log("Could not load file: \(fileName)")
            }
        } catch {
            Log("Could not load tracks")
        }
    }
}
