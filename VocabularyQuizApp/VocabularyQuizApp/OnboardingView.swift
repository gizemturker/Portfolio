//
//  OnboardingView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 15.09.2023.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    let onboardingScreens = [
        OnboardingScreen(title: "Welcome to Vocabulary App", image: "onboarding1"),
        OnboardingScreen(title: "Learn New Words", image: "onboarding2"),
        OnboardingScreen(title: "Improve Your Vocabulary", image: "onboarding3")
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<onboardingScreens.count) { index in
                    OnboardingCardView(onboardingScreen: onboardingScreens[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
            if currentPage == onboardingScreens.count - 1 {
                Button(action: {
     
                }) {
                    Text("Get Started")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            } else {
                Button(action: {
                    currentPage += 1
                }) {
                    Text("Next")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct OnboardingScreen {
    let title: String
    let image: String
}

struct OnboardingCardView: View {
    let onboardingScreen: OnboardingScreen
    
    var body: some View {
        VStack {
            Text(onboardingScreen.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Image(onboardingScreen.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 20)
            
            Spacer()
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

