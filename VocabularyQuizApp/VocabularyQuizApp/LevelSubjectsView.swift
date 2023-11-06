//
//  SubjectListView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 23.08.2023.
//

import SwiftUI

struct LevelSubjectView: View {
    @State private var selectedLevel: EnglishLevel? = nil

    var body: some View {
        VStack {
            NavigationLink(
                destination: LevelSubjectsView(selectedLevel: selectedLevel!),
                isActive: .constant(selectedLevel != nil),
                label: {
                    Text("Start Learning")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            )
            .padding(.top)

            Picker("Select Level", selection: $selectedLevel) {
                Text("A1").tag(EnglishLevel.a1)
                Text("A2").tag(EnglishLevel.a2)
                Text("B1").tag(EnglishLevel.b1)
                Text("B2").tag(EnglishLevel.b2)
                Text("C1").tag(EnglishLevel.c1)
                Text("C2").tag(EnglishLevel.c2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            
            if let selectedLevel = selectedLevel {
                ForEach(getSubjects(for: selectedLevel), id: \.self) { subject in
                    Text(subject)
                }
            }
        }
    }

  
    func getSubjects(for level: EnglishLevel) -> [String] {
        switch level {
        case .a1, .a2, .b1, .b2, .c1, .c2:
            return ["Travel", "Daily Life", "Academic", "Business and Professional", "Health and Fitness", "Technology and Gadgets", "Entertainment and Media", "Social Media and Internet"]
    
        }
    }
}



struct LevelSubjectsView: View {
    var selectedLevel: EnglishLevel

    var body: some View {
        // Your implementation of the subjects view for the selected level
        // You can use the selectedLevel to display specific content for that level
        Text("Subjects for \(selectedLevel.rawValue)")
    }
}

struct LevelSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSubjectView()
    }
}
