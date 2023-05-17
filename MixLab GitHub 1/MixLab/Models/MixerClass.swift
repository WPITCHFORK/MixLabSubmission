//
//  MixerClass.swift
//  MixLab
//
//  Created by Will Pitchfork on 16/04/2023.
//

import Foundation
import AudioKit
import AVFoundation
import SwiftUI
import AudioKitEX
import SoundpipeAudioKit

final class MixerClass: ObservableObject {
    let engine = AudioEngine()
    
    @Published var track1 = AudioPlayer()
    @Published var track2 = AudioPlayer()
    @Published var track3 = AudioPlayer()
    @Published var track4 = AudioPlayer()
    @Published var track5 = AudioPlayer()
    @Published var track6 = AudioPlayer()
    @Published var track7 = AudioPlayer()
    @Published var track8 = AudioPlayer()
    
    @Published var Lesson12Track1 = AudioPlayer()
    
    @Published var master = Mixer()
    @Published var masterMute: Bool = false
    @Published var masterMuteColor = CustomGreen
    @Published var masterPreMute: AUValue = 0
    
    @Published var channel1: Fader?
    @Published var channel2: Fader?
    @Published var channel3: Fader?
    @Published var channel4: Fader?
    @Published var channel5: Fader?
    @Published var channel6: Fader?
    @Published var channel7: Fader?
    @Published var channel8: Fader?
    
    @Published var channel1OUT: Fader?
    @Published var channel2OUT: Fader?
    @Published var channel3OUT: Fader?
    @Published var channel4OUT: Fader?
    @Published var channel5OUT: Fader?
    @Published var channel6OUT: Fader?
    @Published var channel7OUT: Fader?
    @Published var channel8OUT: Fader?
    
    @Published var fader1IN = Mixer()
    @Published var fader2IN = Mixer()
    @Published var fader3IN = Mixer()
    @Published var fader4IN = Mixer()
    @Published var fader5IN = Mixer()
    @Published var fader6IN = Mixer()
    @Published var fader7IN = Mixer()
    @Published var fader8IN = Mixer()
    
    @Published var track1Mute: Bool = false
    @Published var track2Mute: Bool = false
    @Published var track3Mute: Bool = false
    @Published var track4Mute: Bool = false
    @Published var track5Mute: Bool = false
    @Published var track6Mute: Bool = false
    @Published var track7Mute: Bool = false
    @Published var track8Mute: Bool = false
    
    @Published var track1MuteColor = CustomGreen
    @Published var track2MuteColor = CustomGreen
    @Published var track3MuteColor = CustomGreen
    @Published var track4MuteColor = CustomGreen
    @Published var track5MuteColor = CustomGreen
    @Published var track6MuteColor = CustomGreen
    @Published var track7MuteColor = CustomGreen
    @Published var track8MuteColor = CustomGreen
    
    @Published var track1PreMute: AUValue = 0
    @Published var track2PreMute: AUValue = 0
    @Published var track3PreMute: AUValue = 0
    @Published var track4PreMute: AUValue = 0
    @Published var track5PreMute: AUValue = 0
    @Published var track6PreMute: AUValue = 0
    @Published var track7PreMute: AUValue = 0
    @Published var track8PreMute: AUValue = 0
    
    @Published var tracks: [Mixer] = []
    @Published var mutes: [Bool] = []
    @Published var muteColors: [Color] = []
    @Published var preMute: [AUValue] = []
    @Published var channels: [Fader] = []

    @Published var room: Convolution?
    
    @Published var CH = Bundle.main.url(forResource: "Samples/IR/CentralHall", withExtension: "wav")
    @Published var NCEM = Bundle.main.url(forResource: "Samples/IR/NCEM", withExtension: "wav")
    @Published var Gen6 = Bundle.main.url(forResource: "Samples/IR/Gen6", withExtension: "wav")
    @Published var StGeorge = Bundle.main.url(forResource: "Samples/IR/StGeorge", withExtension: "wav")
    @Published var SelectedIR: URL = Bundle.main.url(forResource: "Samples/IR/Gen6", withExtension: "wav")!
    @Published var selectedRoom = "Gen6"
    
    init() {
        channel1 = Fader(track1, gain: 1.0)
        channel2 = Fader(track2, gain: 1.0)
        channel3 = Fader(track3, gain: 1.0)
        channel4 = Fader(track4, gain: 1.0)
        channel5 = Fader(track5, gain: 1.0)
        channel6 = Fader(track6, gain: 1.0)
        channel7 = Fader(track7, gain: 1.0)
        channel8 = Fader(track8, gain: 1.0)
        
        channel1OUT = Fader(channel1!, gain: 1.0)
        channel2OUT = Fader(channel2!, gain: 1.0)
        channel3OUT = Fader(channel3!, gain: 1.0)
        channel4OUT = Fader(channel4!, gain: 1.0)
        channel5OUT = Fader(channel5!, gain: 1.0)
        channel6OUT = Fader(channel6!, gain: 1.0)
        channel7OUT = Fader(channel7!, gain: 1.0)
        channel8OUT = Fader(channel8!, gain: 1.0)
        
        fader1IN = Mixer(channel1OUT!)
        fader2IN = Mixer(channel2OUT!)
        fader3IN = Mixer(channel3OUT!)
        fader4IN = Mixer(channel4OUT!)
        fader5IN = Mixer(channel5OUT!)
        fader6IN = Mixer(channel6OUT!)
        fader7IN = Mixer(channel7OUT!)
        fader8IN = Mixer(channel8OUT!)
        
        tracks = [fader1IN, fader2IN, fader3IN, fader4IN, fader5IN, fader6IN, fader7IN, fader8IN]
        channels = [channel1!, channel2!, channel3!, channel4!, channel5!, channel6!, channel7!, channel8!]
        mutes = [track1Mute, track2Mute, track3Mute, track4Mute, track5Mute, track6Mute, track7Mute, track8Mute]
        muteColors = [track1MuteColor, track2MuteColor, track3MuteColor, track4MuteColor, track5MuteColor, track6MuteColor, track7MuteColor, track8MuteColor]
        preMute = [track1PreMute, track2PreMute, track3PreMute, track4PreMute, track5PreMute, track6PreMute, track7PreMute, track8PreMute]
        
        InitialiseVolumes()
        
        let files = ["Samples/8Track/DQ_Kick8", "Samples/8Track/DQ_OH8", "Samples/8Track/DQ_Bass8", "Samples/8Track/DQ_Guitar8", "Samples/8Track/DQ_Keys8", "Samples/8Track/DQ_Synth8", "Samples/8Track/DQ_Vox1_8", "Samples/8Track/DQ_Vox2_8"]
        
        do {
            Settings.bufferLength = .long
            
            try
            AVAudioSession.sharedInstance()
                .setPreferredIOBufferDuration(Settings.bufferLength
                    .duration)
            
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord, options: [.defaultToSpeaker, .mixWithOthers, .allowBluetoothA2DP])
            
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let err {
            print(err)
        }
        
        loadFile(track: track1, fileName: files[0])
        loadFile(track: track2, fileName: files[1])
        loadFile(track: track3, fileName: files[2])
        loadFile(track: track4, fileName: files[3])
        loadFile(track: track5, fileName: files[4])
        loadFile(track: track6, fileName: files[5])
        loadFile(track: track7, fileName: files[6])
        loadFile(track: track8, fileName: files[7])
        loopFiles()

        master = Mixer(fader1IN, fader2IN, fader3IN, fader4IN, fader5IN, fader6IN, fader7IN, fader8IN, Lesson12Track1)
        
        room = Convolution(master, impulseResponseFileURL: NCEM!)
        
//        switch selectedRoom {
//            case "Gen6":
//                room = Convolution(master, impulseResponseFileURL: Gen6!)
//            case "CH":
//                room = Convolution(master, impulseResponseFileURL: CH!)
//            case "NCEM":
//                room = Convolution(master, impulseResponseFileURL: NCEM!)
//            case "church":
//                room = Convolution(master, impulseResponseFileURL: StGeorge!)
//            default:
//                room = Convolution(master, impulseResponseFileURL: Gen6!)
//        }
        
        
        engine.output = room
        try? engine.start()
    }
    
    func loadFile(track: AudioPlayer, fileName: String) {
        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
                try track.load(url: file)
            } else {
                Log("Could not load file: \(fileName)")
            }
        } catch {
            Log("Could not load tracks")
        }
    }
    
    func loopFiles() {
        track1.isLooping = true
        track2.isLooping = true
        track3.isLooping = true
        track4.isLooping = true
        track5.isLooping = true
        track6.isLooping = true
        track7.isLooping = true
        track8.isLooping = true
    }
    
    fileprivate func InitialiseVolumes() {
        // volume input value is 0...3
        // unity is 1.2
        track1.volume = 1.2
        track2.volume = 1.2
        track3.volume = 1.2
        track4.volume = 1.2
        track5.volume = 1.2
        track6.volume = 1.2
        track7.volume = 1.2
        track8.volume = 1.2
        master.volume = 1.2
        
        
        // range is -60...30 dB
        // unity is 0
        channel1!.dB = -0.0
        channel2!.dB = -0.0
        channel3!.dB = -0.0
        channel4!.dB = -0.0
        channel5!.dB = -0.0
        channel6!.dB = -0.0
        channel7!.dB = -0.0
        channel8!.dB = -0.0
        
        fader1IN.volume = 1.0
        fader2IN.volume = 1.0
        fader3IN.volume = 1.0
        fader4IN.volume = 1.0
        fader5IN.volume = 1.0
        fader6IN.volume = 1.0
        fader7IN.volume = 1.0
        fader8IN.volume = 1.0
    }
}
