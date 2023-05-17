//
//  HoldingView.swift
//  MixLab
//
//  Created by Will Pitchfork on 18/03/2023.
//

import SwiftUI

struct HoldingView: View {
    var selectedLesson: lessonInfo
    @State var lessonDestination: any View = NewView()
    var loading: Bool = true
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomBlue
                    .ignoresSafeArea()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(CustomLightBlue)
                    VStack {
                        Spacer()
                        
                        Image(systemName: selectedLesson.ImageName)
                            .font(.system(size: CGFloat(selectedLesson.ImageSize)))
                            .foregroundColor(CustomBlue)
                        
                        Spacer()
                        VStack {
                            Text("Lesson \(selectedLesson.id)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(CustomBlue)
                            Text(selectedLesson.LongTitle)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(CustomBlue)
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(CustomBlue)
                                .frame(height: 5)
                                .padding(.horizontal, 50)
                        }
                        
                        Spacer()
                        
                        Text(selectedLesson.Description)
                            .foregroundColor(CustomBlue)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 250)
                        
                        Spacer()
                        
                        if selectedLesson.id == 1 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 2 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 3 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 4 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 5 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 6 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 7 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 8 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 9 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 10 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 11 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 12 {
                            Button (action: { }) {
                                NavigationLink(destination: Lesson12().environmentObject(LessonProgress())) { GoButton() }
                            }
                        } else if selectedLesson.id == 13 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        } else if selectedLesson.id == 14 {
                            Button (action: { }) {
                                NavigationLink(destination: ComingSoon()) { GoButton() }
                            }
                        }
                        
                        Spacer()
                    }
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 100)
            }
        }
    }
}


struct ActivityIndicator: UIViewRepresentable {
    typealias UIView = UIActivityIndicatorView
    var isAnimating: Bool
    fileprivate var configuration = { (indicator: UIView) in }
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIView {
        UIView()
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Self>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        configuration(uiView)
    }
}

extension View where Self == ActivityIndicator {
    func configure(_ configuration: @escaping (Self.UIView) -> Void) -> Self {
        Self.init(isAnimating: self.isAnimating, configuration: configuration)
    }
}

//struct HoldingView_Previews: PreviewProvider {
//    static var previews: some View {
//        HoldingView(selectedLesson: lessonInfo(id: 1, ShortTitle: "Intro", LongTitle: "Introduction to Music Technology", ImageName: "magnifyingglass", ImageSize: 150, Description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."), lessons: <#[lessonInfo]#>)
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}

struct GoButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 150, height: 40)
                .foregroundColor(CustomBlue)
            
            Text("Start Lesson")
                .fontWeight(.bold)
                .foregroundColor(CustomLightBlue)
        }
    }
}
