//
//  Lesson12.swift
//  MixLab
//
//  Created by Will Pitchfork on 02/05/2023.
//

import SwiftUI
import AVFoundation
import AudioKit

struct Lesson12: View {
    @EnvironmentObject var lessonPlayer: LessonAudioEngine
    @EnvironmentObject var lp: LessonProgress
    
    @State var prevHidden = true
    @State var nextHidden = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomBlue
                    .ignoresSafeArea()
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(CustomLightBlue)
                    VStack {
                        VStack {
                            Text("Panning")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(CustomBlue)
                                .padding(.top, 35)
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(CustomBlue)
                                .frame(height: 5)
                                .padding(.horizontal, 50)
                            
                            ProgressView(value: Float(lp.L12), total: 12)
                                .padding(.horizontal, 75)
                                .padding(.top, 20)
                            
                            Spacer()
                            
                            switch(lp.L12) {
                                case 0:
                                    Page0()
                                case 1:
                                    Page1()
                                case 2:
                                    Page2()
                                case 3:
                                    Page3()
                                case 4:
                                    Page4()
                                case 5:
                                    Page5()
                                case 6:
                                    Page6()
                                case 7:
                                    QQ1()
                                case 8:
                                    QQ4()
                                        .environmentObject(LessonAudioEngine())
                                case 9:
                                    QQ3()
                                case 10:
                                    QQ2()
                                case 11:
                                    QQ5()
                                        .environmentObject(LessonAudioEngine())
                                case 12:
                                    L12_Complete()
                                default:
                                    ErrorPage()
                            }
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        HStack {
                            if lp.L12 == 0 {
                                
                            } else {
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 50)
                                        .frame(width: 200, height: 40)
                                        .foregroundColor(CustomBlue)
                                    
                                    Button (action: {lp.L12 -= 1}) {
                                        Text("Previous Page")
                                            .fontWeight(.bold)
                                            .foregroundColor(CustomLightBlue)
                                    }
                                }
                                .padding(.horizontal, 50)
                                .padding(.bottom, 20)
                            }
                            
                            Spacer()
                            
                            if lp.L12 == 12 {
                                
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 50)
                                        .frame(width: 200, height: 40)
                                        .foregroundColor(CustomBlue)
                                    Button (action: {lp.L12 += 1}) {
                                        Text("Next Page")
                                            .fontWeight(.bold)
                                            .foregroundColor(CustomLightBlue)
                                    }
                                }
                                .padding(.horizontal, 50)
                                .padding(.bottom, 20)
                            }
                        }
                    }
                }
                .padding(.horizontal, 100)
                .padding(.vertical, 50)
            }
        }
    }
}


struct Page0: View {
    var body: some View {
        VStack {
            VStack {
                Text("Welcome back!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 25)
                Spacer()
                Text("Have you ever heard of stereo? If not, don't worry! We'll cover that in today's lesson!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                Text("We will cover what panning is, how it works, and how to use it in your live mix. We'll listen to some examples to help us identify what panning and stereo are, as well as pin pointing where the sound is coming from. To round this lesson up, we'll then see what instruments usually use stereo in a live setting, and how to make stereo tracks on digital mixing desks.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                Spacer()
            }
            Spacer()
            VStack{
                Spacer()
                Text("Lesson Objectives")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Text("By the end of this lesson, you should be able to:")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .font(.title3)
                    .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(CustomBlue)
                        
                        
                        Text("Understand what panning is")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 50)
                            .foregroundColor(CustomYellow)
                            .fontWeight(.bold)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(CustomBlue)
                        
                        Text("Understand how panning works")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 50)
                            .foregroundColor(CustomYellow)
                            .fontWeight(.bold)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(CustomBlue)
                        
                        Text("Understand how to use panning live")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 50)
                            .foregroundColor(CustomYellow)
                            .fontWeight(.bold)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct Page1: View {
    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack {
                Text("Let's take a step back...")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 25)
                Spacer()
                Text("How do we hear sounds?")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("The world around us has lots of sounds, all coming from different spatial positions. Take a moment to  close your eyes and see what you can hear around you.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("Now do the same again, but see if you can point to where the sound is coming from.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("So how do we do this? Well, most people have two ears, one on either side of their heads. The sound waves being received by the ears will arrive at slightly different times and volumes to each ear. Our brains then do some complicated maths to determine where the sound source actually is.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                Spacer()
                Image("Head")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.2)
                Spacer()
            }
        }
        .padding(.horizontal, 40)
    }
}

struct Page2: View {
    @EnvironmentObject var conductor: MixerClass
    @State private var showingMonoSheet = false
    @State private var showingStereoSheet = false
    
    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack {
                Text("So what is panning?")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 25)
                Spacer()
                Text("The definition of panning is the act of positioning sounds at different locations within a horizontal field. To understand this deeper, we also need to understand the difference between mono and stereo.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Spacer()
                Text("Click on the buttons below to learn about mono or stereo")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("If you have some headphones, put them on now for the best experience!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .font(.title2)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 25)
                Image("Headphones")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.25)
                    .padding(.bottom, 80)
                Spacer()
                HStack {
                    Spacer()
                    Button (action: {
                        showingMonoSheet.toggle()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(CustomBlue)
                            Text("Mono")
                                .multilineTextAlignment(.center)
                                .font(.title)
                                .foregroundColor(CustomYellow)
                                .fontWeight(.bold)
                                .padding(.vertical, 20)
                        }
                        .padding(.leading, 120)
                        .padding(.trailing, 50)
                    }
                    .sheet(isPresented: $showingMonoSheet) {
                        monoSheet()
                            .environmentObject(LessonAudioEngine())
                    }
                    .foregroundColor(CustomBlue)
                    Spacer()
                    Button (action: {
                        showingStereoSheet.toggle()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(CustomBlue)
                            Text("Stereo")
                                .multilineTextAlignment(.center)
                                .font(.title)
                                .foregroundColor(CustomYellow)
                                .fontWeight(.bold)
                        }
                        .padding(.leading, 50)
                        .padding(.trailing, 120)
                    }
                    .sheet(isPresented: $showingStereoSheet) {
                        stereoSheet()
                            .environmentObject(LessonAudioEngine())
                    }
                    .foregroundColor(CustomBlue)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}


struct monoSheet: View {
    @EnvironmentObject var audio:  LessonAudioEngine
    
    var body: some View {
        ZStack {
            CustomLightBlue
                .ignoresSafeArea()
            
            VStack {
                Text("Mono")
                    .padding(.top, 30)
                    .font(.largeTitle)
                    .foregroundColor(CustomBlue)
                    .fontWeight(.bold)
                
                Spacer()
                
                Text("Mono audio is when the sound being played is only coming from one source, or if there is more than one speaker, there is only one channel of audio being sent. This results in every speaker playing the exact same thing.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                
                Spacer()
                
                Text("Listen to this example of a mono track...")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                
                Image("HardDaysNightWaveform")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400)
                
                Button (action: {
                    audio.HDN.play()
                }) {
                    GoButton2()
                }
                .padding(.vertical, 20)
                
                Spacer()
                
                Text("If you listen carefully, you'll notice everything sounds like it's coming from in front of you! Well that's mono! Both the left and right channel of your speakers or headphones are playing everything at the same volume.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                
                Spacer()
            }
        }
    }
}

struct stereoSheet: View {
    @EnvironmentObject var audio: LessonAudioEngine
    
    var body: some View {
        ZStack {
            CustomLightBlue
                .ignoresSafeArea()
            
            VStack {
                Text("Stereo")
                    .padding(.top, 30)
                    .font(.largeTitle)
                    .foregroundColor(CustomBlue)
                    .fontWeight(.bold)
                
                Spacer()
                
                ScrollView {
                    Text("So what about stereo? Whereas mono uses all channels at the same volume, stereo has two channels; left, and right. Instruments can be 'panned' to either one side or the other, or anywhere in between. This gives the mix more space and allows the listener to hear things a lot clearer and pin point where the sound is coming from.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 80)
                        .foregroundColor(CustomBlue)
                        .padding(.bottom, 15)
                    
                    Spacer()
                    
                    Text("Let's listen to two examples of stereo tracks...")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 120)
                        .foregroundColor(CustomBlue)
                        .padding(.bottom, 15)
                    
                    VStack {
                        Text("First, an example of where the instruments are panned left and right. You can hear the two guitars in this track very clearly at opposite sides of your head.")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 60)
                            .foregroundColor(CustomBlue)
                            .padding(.bottom, 15)
                        Image("RUMineWaveform")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                        
                        Button (action: {
                            audio.RUMine.play()
                        }) {
                            GoButton2()
                        }
                        .padding(.vertical, 20)
                    }
                    
                    VStack {
                        Text("And now, a full stereo mix, with instruments filling the horizontal space.")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 60)
                            .foregroundColor(CustomBlue)
                            .padding(.bottom, 15)
                        
                        Image("BoRhapWaveform")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                        
                        Button (action: {
                            audio.BoRhap.play()
                        }) {
                            GoButton2()
                        }
                        .padding(.vertical, 20)
                    }
                    
                    
                    Spacer()
                }
            }
        }
    }
}

struct Page3: View {
    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack {
                Text("Ok... I understand what panning is now, but how can I use it live?")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 25)
                Spacer()
                Text("Panning is a very important tool to know about, but we don't use it in the live world much!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("Stereo mixes are great for small spaces, where the audience are all in a similar spot, and they are amazing for headphones where the listener is always right in the middle! But in the live world, the audience are very spaced out and there's usually a lot of other noise in the room you need to fight against (like the audience if they're loud, or the natural sound coming from instruments like drums.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("Imagine you're stood in an arena. You want to hear every instrument that is on stage whether you are stood in the middle, or on the very edge of the room. If you created a stereo mix and had one of the guitars panned to the right, but you were stood on the very left of the room, you just wouldn't hear it, especially not with thousands of cheering people stood in between you and the speakers!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("For this reason, we tend to only use stereo with certain instruments, or in certain situations. We'll look at these on the next page.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                Spacer()
                Image("Concert")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                Spacer()
            }
        }
        .padding(.horizontal, 40)
    }
}

struct Page4: View {
    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack {
                Text("When should I use stereo and panning?")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 25)
                Spacer()
                Text("There are three main times you should use panning and stereo mixing.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                VStack{
                    Text("If the instrument is a stereo instrument")
                        .padding(.horizontal, 120)
                        .padding(.bottom, 10)
                        .foregroundColor(CustomBlue)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Some instruments are have stereo outputs. Things like keyboards, organs, synthesisers, and some guitar amps have a stereo output. If this is the case, it is common practice to have the left channel panned hard left, and the right channel panned hard right. If you don't have enough channels on your desk for this though, just use the left output and have it panned central.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 120)
                        .foregroundColor(CustomBlue)
                        .padding(.bottom, 25)
                    Text("If your musicians are using stereo in ear monitors")
                        .padding(.horizontal, 120)
                        .padding(.bottom, 10)
                        .foregroundColor(CustomBlue)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("In ear monitors are becoming more and more accessible to musicians, so you'll start to have to deal with them sooner in your career than engineers used to. If the musician wants a stereo mix, make sure you're using stereo connections for things like keyboards, as this can clean up their in ear mix and help them hear what they need to when they are on stage. If you can do this, they will have a better experience and perform better!")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 120)
                        .foregroundColor(CustomBlue)
                        .padding(.bottom, 25)
                    Text("If you have a really busy mix")
                        .padding(.horizontal, 120)
                        .padding(.bottom, 10)
                        .foregroundColor(CustomBlue)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("Sometimes when a mix is really busy, it can pay off to pan some things ever so slightly (less than 10%). This can put less stress on the speakers you are using, result in the same overall mix, but have it sounding cleaner. You will also still be able to hear everything all around the room.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 120)
                        .foregroundColor(CustomBlue)
                        .padding(.bottom, 25)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 40)
    }
}

struct Page5: View {
    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack {
                Text("A little helpful tip for digital desks...")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 25)
                Spacer()
                Text("If you're using a digital desk, then I've got a little tip for you that will make your life easier!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("On a lot of digital desks, you can 'link' two channels and turn them into a stereo one. The first channel will be panned hard left (and is usually an odd channel), and the second one hard right (the next even channel). Another helpful feature of linking channels is that whatever you do to one channel, will copy across to the other! This is very useful for things such as EQ, compression, or reverb.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("If you want to turn channel linking on, go into the channel settings and you will find a button labelled 'Stereo Link' or 'Link Channels'.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("Take a look at the images below to see which button you are looking out for in some popular iPad apps.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                Spacer()
                    HStack {
                        VStack {
                            Image("XAirEdit")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding()
                                .frame(height: UIScreen.main.bounds.height * 0.4)
                            Text("XAir Edit")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 120)
                                .foregroundColor(CustomBlue)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                        }
                        
                        VStack {
                            Image("X32Mix")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding()
                                .frame(height: UIScreen.main.bounds.height * 0.4)
                            Text("X32 Mix")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 120)
                                .foregroundColor(CustomBlue)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                        }
                    }
                    
                    HStack {
                        VStack {
                            Image("MixingStation")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding()
                                .frame(height: UIScreen.main.bounds.height * 0.4)
                            Text("Mixing Station")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 120)
                                .foregroundColor(CustomBlue)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                        }
                        
                        VStack {
                            Image("QUPad")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding()
                                .frame(height: UIScreen.main.bounds.height * 0.4)
                            Text("QU-Pad")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 120)
                                .foregroundColor(CustomBlue)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                        }
                    }
                Spacer()
            }
        }
        .padding(.horizontal, 40)
    }
}

struct Page6: View {
    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack {
                Text("Summary")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 25)
                Spacer()
                Text("Lets go back and recap what we've learnt in this lesson.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("We've looked at how we hear sounds in the real world, with two ears both receiving the sound at slightly different times and volumes.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("We've looked at panning and the difference between mono and stereo, and listened to some examples so we know what they sound like. ")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("We've looked at panning's limited use in live applications, but also where we should be using it, like keyboards and guitars")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Text("And then we looked at how we can use stereo linking on digital desks to make two mono channels behave like one stereo one!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 120)
                    .foregroundColor(CustomBlue)
                    .padding(.bottom, 15)
                Spacer()
                Image("Quiz")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                Spacer()
            }
        }
        .padding(.horizontal, 40)
    }
}


struct QQ1: View {
    @State var option1Color = CustomBlue
    @State var option2Color = CustomBlue
    @State var option3Color = CustomBlue
    @State var option4Color = CustomBlue
    
    @EnvironmentObject var score: LessonProgress
    
    var body: some View {
        VStack {
            Image("Quiz")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
            
            Text("Question 1")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)
                .foregroundColor(CustomBlue)
                .padding(.bottom, 15)
            
            Spacer()
            
            Text("How often do we use panning in the live music world?")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)
                .foregroundColor(CustomBlue)
                .padding(.bottom, 15)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomGreen
                    option3Color = CustomRed
                    option4Color = CustomRed
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option1Color, lineWidth: 5)
                        Text("Never")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.all, 20)
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomGreen
                    option3Color = CustomRed
                    option4Color = CustomRed
                    
                    score.L12Score += 1
                    print(score.L12Score)
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option2Color, lineWidth: 5)
                        Text("Occassionally")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.all, 20)
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomGreen
                    option3Color = CustomRed
                    option4Color = CustomRed
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option3Color, lineWidth: 5)
                        Text("Loads!")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.all, 20)
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomGreen
                    option3Color = CustomRed
                    option4Color = CustomRed
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option4Color, lineWidth: 5)
                        Text("All the time")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.all, 20)
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct QQ2: View {
    @State var option1Color = CustomBlue
    @State var option2Color = CustomBlue
    @State var option3Color = CustomBlue
    @State var option4Color = CustomBlue
    
    @EnvironmentObject var score: LessonProgress
    
    var body: some View {
        VStack {
            Image("Quiz")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
            
            Text("Question 2")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)
                .foregroundColor(CustomBlue)
                .padding(.bottom, 15)
            
            Spacer()
            
            Text("What is panning in a live music context?")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)
                .foregroundColor(CustomBlue)
                .padding(.bottom, 15)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomRed
                    option3Color = CustomRed
                    option4Color = CustomGreen
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option1Color, lineWidth: 5)
                        Text("Sifting dirt to find gold")
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                    }
                }
                .padding(.all, 20)
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomRed
                    option3Color = CustomRed
                    option4Color = CustomGreen
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option2Color, lineWidth: 5)
                        Text("Hitting someone with a pan")
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                    }
                }
                .padding(.all, 20)
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomRed
                    option3Color = CustomRed
                    option4Color = CustomGreen
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option3Color, lineWidth: 5)
                        Text("Adding more reverb to a channel")
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                    }
                }
                .padding(.all, 20)
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomRed
                    option3Color = CustomRed
                    option4Color = CustomGreen
                    
                    score.L12Score += 1
                    print(score.L12Score)
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option4Color, lineWidth: 5)
                        Text("Putting sounds in different horizontal spaces to enhance a mix")
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                    }
                }
                .padding(.all, 20)
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct QQ3: View {
    @State var option1Color = CustomBlue
    @State var option2Color = CustomBlue
    @State var option3Color = CustomBlue
    @State var option4Color = CustomBlue
    
    @EnvironmentObject var score: LessonProgress
    
    var body: some View {
        VStack {
            Image("Quiz")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
            
            Text("Question 3")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)
                .foregroundColor(CustomBlue)
                .padding(.bottom, 15)
            
            Spacer()
            
            Text("The band has a keyboard, the musician is using stereo in ear monitors, should you use the stereo output on the keyboard or the mono one?")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)
                .foregroundColor(CustomBlue)
                .padding(.bottom, 15)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomGreen
                    option3Color = CustomRed
                    option4Color = CustomRed
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option1Color, lineWidth: 5)
                        Text("Mono")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.all, 20)
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomGreen
                    option3Color = CustomRed
                    option4Color = CustomRed
                    
                    score.L12Score += 1
                    print(score.L12Score)
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option2Color, lineWidth: 5)
                        Text("Stereo")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.all, 20)
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct QQ4: View {
    @State var option1Color = CustomBlue
    @State var option2Color = CustomBlue
    @State var option3Color = CustomBlue
    @State var option4Color = CustomBlue
    
    @EnvironmentObject var score: LessonProgress
    @EnvironmentObject var audio: LessonAudioEngine
    
    var body: some View {
        VStack {
            Image("Quiz")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
            
            Text("Question 4")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)
                .foregroundColor(CustomBlue)
                .padding(.bottom, 15)
            
            Spacer()
            
            Text("Listen to this track... Is it mono or stereo?")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)
                .foregroundColor(CustomBlue)
                .padding(.bottom, 15)
            
            Spacer()
            
            Button (action: {
                audio.SLTS.play()
            }) {
                GoButton2()
            }
            .padding(.vertical, 20)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomGreen
                    option3Color = CustomRed
                    option4Color = CustomRed
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option1Color, lineWidth: 5)
                        Text("Mono")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.all, 20)
                Spacer()
                Button(action: {
                    option1Color = CustomRed
                    option2Color = CustomGreen
                    option3Color = CustomRed
                    option4Color = CustomRed
                    
                    score.L12Score += 1
                    print(score.L12Score)
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option2Color, lineWidth: 5)
                        Text("Stereo")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.all, 20)
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct QQ5: View {
    @State var option1Color = CustomBlue
    @State var option2Color = CustomBlue
    @State var option3Color = CustomBlue
    @State var option4Color = CustomBlue
    
    @EnvironmentObject var score: LessonProgress
    @EnvironmentObject var audio: LessonAudioEngine
    
    var body: some View {
        VStack {
            Image("Quiz")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
            
            Text("Question 5")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)
                .foregroundColor(CustomBlue)
                .padding(.bottom, 15)
            
            Spacer()
            
            Text("And finally, a tricky one! Listen to this track... is it mono or stereo?")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 120)
                .foregroundColor(CustomBlue)
                .padding(.bottom, 15)
            
            Spacer()
            
            Button (action: {
                audio.September.play()
            }) {
                GoButton2()
            }
            .padding(.vertical, 20)
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    option1Color = CustomGreen
                    option2Color = CustomRed
                    option3Color = CustomRed
                    option4Color = CustomRed
                    
                    score.L12Score += 1
                    print(score.L12Score)
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option1Color, lineWidth: 5)
                        Text("Mono")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.all, 20)
                Spacer()
                Button(action: {
                    option1Color = CustomGreen
                    option2Color = CustomRed
                    option3Color = CustomRed
                    option4Color = CustomRed
                    
                    
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(option2Color, lineWidth: 5)
                        Text("Stereo")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(CustomBlue)
                            .fontWeight(.bold)
                    }
                }
                .padding(.all, 20)
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct L12_Complete: View {
    @EnvironmentObject var score: LessonProgress
    
    var body: some View {
        VStack {
            Spacer()
            Image("Quiz")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding()
                .frame(height: UIScreen.main.bounds.height * 0.3)
            
            Spacer()
            
            if score.L12Score <= 2 {
                VStack {
                    Text("Good try!")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(CustomBlue)
                        .fontWeight(.bold)
                        .padding(.bottom, 50)
                    
                    Text("You scored \(score.L12Score) out of 5")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(CustomBlue)
                        .padding(.bottom, 30)
                    
                    Text("Maybe you should take a break and then go back through this lesson again")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(CustomBlue)
                }
            } else if score.L12Score == 3 {
                VStack {
                    Text("Nearly!")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(CustomBlue)
                        .fontWeight(.bold)
                        .padding(.bottom, 50)
                    
                    Text("You scored \(score.L12Score) out of 5")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(CustomBlue)
                        .padding(.bottom, 30)
                    
                    Text("You were so close to passing this lesson! Have a quick recap and try the lesson again.")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(CustomBlue)
                }
            } else {
                VStack {
                    Text("Congratulations!")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(CustomBlue)
                        .fontWeight(.bold)
                        .padding(.bottom, 50)
                    
                    Text("You scored \(score.L12Score) out of 5")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(CustomBlue)
                        .padding(.bottom, 30)
                    
                    Text("You've passed this lesson! On to the next one now!")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(CustomBlue)
                }
            }
            Spacer()
        }
    }
}

struct Lesson12_Previews: PreviewProvider {
    static var previews: some View {
        monoSheet()
    }
}

struct GoButton2: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 150, height: 40)
                .foregroundColor(CustomBlue)
            
            Text("Play")
                .fontWeight(.bold)
                .foregroundColor(CustomLightBlue)
        }
    }
}

struct ErrorPage: View {
    var body: some View {
        Text("Oops... something's gone wrong.")
            .font(.largeTitle)
            .foregroundColor(CustomBlue)
        Text("Please go back and try again.")
            .font(.title)
            .foregroundColor(CustomBlue)
    }
}


