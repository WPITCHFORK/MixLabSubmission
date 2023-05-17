//
//  LessonsView.swift
//  MixLab
//
//  Created by Will Pitchfork on 14/03/2023.
//

import SwiftUI

struct LessonsButton: View {
    var body: some View {
        Button (action: { }) {
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .aspectRatio(1.0, contentMode: ContentMode.fit)
                    .foregroundColor(CustomLightBlue)
                
                NavigationLink(destination: LessonView()) {
                    VStack {
                        Image(systemName: "graduationcap.fill")
                            .font(.system(size: 150))
                            .foregroundColor(CustomBlue)
                        Text("Lessons")
                            .font(.system(size: 50))
                            .foregroundColor(CustomBlue)
                            .fontWeight(.heavy)
                    }
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct LessonsButton_Previews: PreviewProvider {
    static var previews: some View {
        LessonsButton()
    }
}
