//
//  WelcomeView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 23.08.2023.
//

import SwiftUI

struct WelcomeView: View {
    @State private var selectedLevel: EnglishLevel?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Vocabulary App")
                    .font(.title)
                    .padding()
                
                Button(action: {
                    selectedLevel = nil
                }, label: {
                    NavigationLink(
                        destination: TestView(),
                        label: {
                            Text("Start to Test")
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                })
                .padding(.bottom)
                
                NavigationLink(
                    destination: LevelSubjectView(), 
                    label: {
                        Text("Choose Your Level")
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                )

            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
