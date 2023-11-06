//
//  ContentView.swift
//  HatayEarthquakeMemorial
//
//  Created by Gizem Turker on 11.04.2023.
//


import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State var animation: Int = 0
    @State private var pageIndex = 0
    private let pages: [Page] = Page.storyPages
    private let dotAppearance = UIPageControl.appearance()

    var body: some View {
        VStack{
            if(Page.storyPages[pageIndex].earthquake) {
                Image("hataylogo")
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .frame(width: 200)            .modifier(Earthquake(animatableData: CGFloat(animation)))
            } else {
                Image("hataylogo")
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .frame(width: 200)
            }
            ScrollView {
                if(Page.storyPages[pageIndex].earthquake) {
                    WelcomeView(page: Page.storyPages[pageIndex])                .modifier(Earthquake(animatableData: CGFloat(animation)))
                } else {
                    WelcomeView(page: Page.storyPages[pageIndex])
                }
                
            }
            
            HStack {
                
                if appState.lastPage == true {
                    Button {
                        pageIndex -= 1
                        appState.lastPage = false
                        withAnimation(.default) {
                            self.animation -= 1
                        }
                    } label: {
                        Text("Previous")
                            .font(.headline)
                            .frame(width: 100, height: 35)
                    }
                    .buttonStyle(.bordered)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    Button {
                        appState.isIntroFinished = true
                        withAnimation(.default) {
                            self.animation += 1
                        }
                    } label: {
                        Text("Visit Hatay")
                            .font(.headline)
                            .frame(width: 100, height: 35)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(20)
                    
                    
                } else {
                    if pageIndex != 0 {
                        Button {
                            pageIndex -= 1
                            withAnimation(.default) {
                                self.animation -= 1
                            }
                        } label: {
                            Text("Previous")
                                .font(.headline)
                                .frame(width: 100, height: 35)
                        }
                        .buttonStyle(.bordered)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                    }
                    Button {
                        pageIndex += 1
                        if(pageIndex == pages.count - 1  && !appState.lastPage) {
                            appState.lastPage = true
                        } else {
                            appState.lastPage = false
                        }
                        
                        withAnimation(.default) {
                            self.animation += 1
                        }
                    } label: {
                        Text("Next")
                            .font(.headline)
                            .frame(width: 100, height: 35)
                    }
                    .buttonStyle(.bordered)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(20)
                    
                }
            }
        }
    }
}

struct Earthquake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit: CGFloat = 20
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let randomX = CGFloat.random(in: -1...1)
        let randomY = CGFloat.random(in: -1...1)
        let intensity = amount/2 * (1 - animatableData)
        let rotation = Angle(degrees: Double.random(in: -1...1))
        let transform = CGAffineTransform(rotationAngle: CGFloat(rotation.radians))
            .concatenating(CGAffineTransform(translationX: intensity * randomX, y: intensity * randomY))
        return ProjectionTransform(transform)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        @ObservedObject var appState = AppState(isIntroFinished: false, lastPage: false)
        ContentView().environmentObject(appState)
    }
}






