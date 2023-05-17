//
//  LessonView.swift
//  MixLab
//
//  Created by Will Pitchfork on 15/03/2023.
//

import SwiftUI
import UIKit

struct LessonView: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    let columnLayout = Array(repeating: GridItem(), count: 3)
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomBlue.ignoresSafeArea()
                
                ScrollView {
                    LazyVGrid(columns: columnLayout) {
                        ForEach(lessons) { lessonInfo in
                            Button (action: { }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(CustomLightBlue)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                    NavigationLink(destination: HoldingView(selectedLesson: lessonInfo)) {
                                        VStack {
                                            Spacer()
                                            Image(systemName: lessonInfo.ImageName)
                                                .font(.system(size: CGFloat(lessonInfo.ImageSize)))
                                                .foregroundColor(CustomBlue)
                                                .padding(.bottom, 20)
                                            Spacer()
                                            Text("Lesson \(lessonInfo.id): \(lessonInfo.LongTitle)")
                                                .foregroundColor(CustomBlue)
                                                .font(.title)
                                                .fontWeight(.semibold)
                                            Spacer()
                                        }
                                        .padding(.all, 50)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
            }
            .navigationBarTitle("Lessons", displayMode: .inline)
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct lessonInfo: Identifiable, Hashable {
    var id: Int
    let ShortTitle: String
    let LongTitle: String
    let ImageName: String
    let ImageSize: Int
    let Description: String
}

private let lessons: [lessonInfo] = [
    lessonInfo(id: 1, ShortTitle: "Intro", LongTitle: "Introduction to Music Technology", ImageName: "magnifyingglass", ImageSize: 120, Description: "What is music technology? Who is this app for? Why is music technology important? All of these questions will be answered throughout this lesson as we look at a brief history of music technology and explore how to get the best out of MixLab."),
    lessonInfo(id: 2, ShortTitle: "MusTec at UoY", LongTitle: "Music Technology at The University of York", ImageName: "graduationcap.fill", ImageSize: 100, Description: "MixLab has been created as a Masters project at the University of York, by a student studying the Electronics Engineering with Music Technology Systems program. The University of York is a leading institution for music technology and outreach is so important as part of this. This lesson will give you an overview of what is taught within the program so you can find out more information if you are interested!"),
    lessonInfo(id: 3, ShortTitle: "What", LongTitle: "What Will You Learn From MixLab?", ImageName: "person.fill.questionmark", ImageSize: 125, Description: "In this lesson, you'll learn what MixLab will teach you, how you will learn using the app, and what you will be able to get out of it by completing the course."),
    lessonInfo(id: 4, ShortTitle: "Differences", LongTitle: "Differences Between Live and Studio Mixing", ImageName: "airpodsmax", ImageSize: 100, Description: "Live mixing and studio mixing are two very different jobs! This lesson will teach you the differences as it is crucial to understand them!"),
    lessonInfo(id: 5, ShortTitle: "Equipment", LongTitle: "What Equipment is Used", ImageName: "cable.connector.horizontal", ImageSize: 150, Description: "What equipment will you need when you have completed this course? Getting out in the real world will require you to know what equipment is used within the industry to ensure you have access to all the relevant gear to be able to make noise! You'll learn about what cables are needed, different types of inputs, and much more!"),
    lessonInfo(id: 6, ShortTitle: "Layout", LongTitle: "Layout and Design of Mixers", ImageName: "square.on.square.squareshape.controlhandles", ImageSize: 100, Description: "In this lesson we'll deep dive into how traditional mixing desks are structured. This will help you understand signal flow and allow you to walk into any venue and understand how to use the desk they have! We'll look at both analogue and digital mixing desks."),
    lessonInfo(id: 7, ShortTitle: "Placement", LongTitle: "Microphone Placement", ImageName: "music.mic", ImageSize: 100, Description: "So we know what equipment we need and how to get sound out of our desk. But where do we actually put the microphone (if we're using one)? Complete this lesson to understand mic placement!"),
    lessonInfo(id: 8, ShortTitle: "Gain", LongTitle: "Gain Staging", ImageName: "mic.and.signal.meter", ImageSize: 100, Description: "The band are ready... you've plugged everything in... the mics are in the right place... but everything is either way too quiet or so loud it's distorting. Now what? We need to set the gain! This lesson will show you what you're aiming for and the way to achieve it!"),
    lessonInfo(id: 9, ShortTitle: "EQ", LongTitle: "EQ", ImageName: "trapezoid.and.line.vertical.fill", ImageSize: 100, Description: "What's EQ? We like to abbreviate things, so EQ is just short for equalisation. What does that actually mean though? And how does it affect the sound? Well I suppose you'll have to complete this lesson and find out won't you!"),
    lessonInfo(id: 10, ShortTitle: "Compression", LongTitle: "Compression", ImageName: "dial.medium.fill", ImageSize: 100, Description: "Compression? Isn't that squeezing things into a smaller space and removing dead space? Exactly! Learn what that actually means in the audio world within this lesson."),
    lessonInfo(id: 11, ShortTitle: "FX", LongTitle: "Other FX", ImageName: "dot.radiowaves.left.and.right", ImageSize: 100, Description: "FX? We've abbreviated again... What effects can we typically add to our audio in most mixing desks? You know the drill by now, complete the lesson to find out!"),
    lessonInfo(id: 12, ShortTitle: "Panning", LongTitle: "Panning", ImageName: "frying.pan", ImageSize: 100, Description: "Even though the image for this lesson might make you think it's something to do with pans, its not (funnily enough). This lesson will teach you how moving where the sound is coming from horizontally can be useful to change your sound."),
    lessonInfo(id: 13, ShortTitle: "Mix", LongTitle: "Main Mix", ImageName: "slider.vertical.3", ImageSize: 150, Description: "So we have all our individual sound sources and they all sound great. The next step is to make it sound good when you mix them together! We want to be able to hear each source and have a nice mix where certain things aren't overpowering. And when it all comes together, you'll have cracked mixing live audio and be able to mix a live band!"),
    lessonInfo(id: 14, ShortTitle: "Monitors", LongTitle: "Monitors, Busses, and Auxillaries", ImageName: "bus", ImageSize: 100, Description: "Again, this isn't to do with busses or coaches. We have things called busses and auxillaries (auxes) which can provide a different output with a different mix. Brilliant for giving each musician on stage a different mix than the front of house. They will be able to hear what they need to perform to an amazing standard. A good monitor mix can make or break a performance so learn the best way to do this!")
]

