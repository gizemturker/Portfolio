//
//  WelcomePageView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 22.08.2023.
//


import SwiftUI

enum EnglishLevel: String, CaseIterable, Identifiable {
    case a1 = "Word Explorer (CEFR: A1-Novice)"
    case a2 = "Phrase Adventurer (CEFR: A2 - Basic)"
    case b1 = "Term Tracker (CEFR: B1 - Limited Working Proficiency)"
    case b2 = "Vocabulary Voyager (CEFR: B2 - Professional Working Proficiency)"
    case c1 = "Lexical Luminary (CEFR: C1 - Full Professional Proficiency)"
    case c2 = "Word Maestro (CEFR: C2 - Native or Bilingual Proficiency)"
    
    var id: String { self.rawValue }
}


import SwiftUI

struct LevelSelectionView : View {
    @State private var selectedLevel: EnglishLevel?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Vocabulary App")
                    .font(.title)
                    .padding()
                
                List {
                    ForEach(EnglishLevel.allCases) { level in
                        Button(action: {
                            selectedLevel = level
                        }, label: {
                            HStack {
                                Text(level.rawValue)
                                Spacer()
                                if selectedLevel == level {
                                    Image(systemName: "checkmark")
                                }
                            }
                        })
                    }
                }
                .listStyle(PlainListStyle())
                
                NavigationLink(
                    destination: LevelSubjectsView(selectedLevel: selectedLevel ?? .a1), // Replace .a1 with your default level
                    isActive: Binding(
                        get: { selectedLevel != nil },
                        set: { isActive in
                            if !isActive {
                                selectedLevel = nil
                            }
                        }
                    ),
                    label: {
                        Text("Start Learning")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                )
                .padding(.top, 20)

            }
        }
    }
}



func getSubjectsForLevel(level: EnglishLevel?) -> [String] {
    guard let selectedLevel = level else {
        return []
    }
    
    switch selectedLevel {
    case .a1:
        return ["Travel", "Daily Life", "Academic", "Business and Professional", "Health and Fitness", "Technology and Gadgets", "Entertainment and Media", "Social Media and Internet", "Programming and Development"]
    case .a2:
        return ["Travel", "Daily Life", "Academic", "Business and Professional", "Health and Fitness", "Technology and Gadgets", "Entertainment and Media", "Social Media and Internet", "Programming and Development"]
    case .b1:
        return ["Travel", "Daily Life", "Academic", "Business and Professional", "Health and Fitness", "Technology and Gadgets", "Entertainment and Media", "Social Media and Internet", "Programming and Development"]
    case .b2:
        return ["Travel", "Daily Life", "Academic", "Business and Professional", "Health and Fitness", "Technology and Gadgets", "Entertainment and Media", "Social Media and Internet", "Programming and Development"]
    case .c1:
        return ["Travel", "Daily Life", "Academic", "Business and Professional", "Health and Fitness", "Technology and Gadgets", "Entertainment and Media", "Social Media and Internet", "Programming and Development"]
    case .c2:
        return ["Travel", "Daily Life", "Academic", "Business and Professional", "Health and Fitness", "Technology and Gadgets", "Entertainment and Media", "Social Media and Internet", "Programming and Development"]
    }
}





struct LevelSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LevelSelectionView()
        }
    }
}

