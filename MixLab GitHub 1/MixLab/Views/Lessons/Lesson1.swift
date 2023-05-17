//
//  Lesson 1.swift
//  MixLab
//
//  Created by Will Pitchfork on 30/03/2023.
//

import SwiftUI

struct Lesson1: View {
    
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
                            Text("Introduction to Music Technology")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(CustomBlue)
                                .padding(.top, 50)
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(CustomBlue)
                                .frame(height: 5)
                                .padding(.horizontal, 50)
                            
                            Spacer()
                            
                            Text("Welcome to lesson 1 of MixLab!")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 120)
                                .foregroundColor(CustomBlue)
                            Text("")
                            Text("As you've seen on the lesson overview, we'll be looking at what MixLab can be used for, as well as who can use it.")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 120)
                                .foregroundColor(CustomBlue)
                            Text("Welcome to lesson 1 of MixLab!")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 120)
                                .foregroundColor(CustomBlue)
                            Text("")
                            Text("The lesson objectives for this lesson are:")
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 120)
                                .padding(.top, 30)
                                .padding(.bottom, 10)
                                .foregroundColor(CustomBlue)
                            VStack {
                                Text("1.    Understand what music technolog is")
                                Text("2.    Understand who this app is for")
                                Text("3.    Understand why music technology is important")
                                Text("4.    Understand the history of music technology")
                            }
                            .padding(.bottom, 150)
                            .foregroundColor(CustomBlue)
                        }
                        
                                ZStack {
                                    RoundedRectangle(cornerRadius: 50)
                                        .frame(width: 150, height: 40)
                                        .foregroundColor(CustomBlue)
                                    
                                    Text("Next Page")
                                        .fontWeight(.bold)
                                        .foregroundColor(CustomLightBlue)
                                }
                                .padding(.bottom, 50)
                    }
                }
                .padding(.horizontal, 100)
                .padding(.vertical, 50)
            }
        }
    }
}

struct Lesson1_Previews: PreviewProvider {
    static var previews: some View {
        Lesson1()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
