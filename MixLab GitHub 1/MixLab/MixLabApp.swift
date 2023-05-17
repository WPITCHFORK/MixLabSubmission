//
//  MixLabApp.swift
//  MixLab
//
//  Created by Will Pitchfork on 12/03/2023.
//

import SwiftUI
import UIKit

// MARK: Declare colour variables to be used within the app
let CustomPaleBlue = Color("CustomPaleBlue")
let CustomLightBlue = Color("CustomLightBlue")
let CustomBlue = Color("CustomBlue")

let CustomGreen = Color("CustomGreen")
let CustomOrange = Color("CustomOrange")
let CustomYellow = Color("CustomYellow")

let CustomLightRed = Color("CustomLightRed")
let CustomRed = Color("CustomRed")



@main
struct MixLabApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var conductor = MixerClass()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(conductor)
        }
    }
}
