//
//  VocabularyListView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 22.08.2023.
//

import SwiftUI

import SwiftUI

struct VocabularyListView: View {
    var subject: String
    var selectedLevel: EnglishLevel?
    
   
    var words: [Word] = [
        Word(question: "What is the meaning of 'Elma'?", choices: ["Apple", "Banana", "Peach"], correctChoiceIndex: 0),
        Word(question: "What is the meaning of 'Muz'?", choices: ["Apple", "Banana", "Peach"], correctChoiceIndex: 1),
        Word(question: "What is the meaning of 'Şeftali'?", choices: ["Apple", "Banana", "Peach"], correctChoiceIndex: 2)
      
    ]
    
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswerIndex: Int?
    @State private var showCorrectAnswer = false
    
    var currentWord: Word {
        words[currentQuestionIndex]
    }
    
    var body: some View {
        VStack {
            Text(currentWord.question)
                .font(.headline)
                .padding()
            
            ForEach(0..<currentWord.choices.count, id: \.self) { index in
                Button(action: {
                    selectedAnswerIndex = index
                    showCorrectAnswer = index == currentWord.correctChoiceIndex
                }, label: {
                    Text(currentWord.choices[index])
                        .padding()
                        .background(
                            selectedAnswerIndex == index ?
                            (showCorrectAnswer && index == currentWord.correctChoiceIndex ? Color.green : Color.red) :
                            Color.white
                        )
                        .cornerRadius(10)
                })
                .disabled(selectedAnswerIndex != nil)
                .padding(.bottom, 5)
            }
            
            if selectedAnswerIndex != nil {
                Button(action: {
                    if currentQuestionIndex < words.count - 1 {
                        currentQuestionIndex += 1
                        selectedAnswerIndex = nil
                        showCorrectAnswer = false
                    }
                }, label: {
                    Text("Next Question")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                .padding(.top)
            }
        }
        .navigationTitle("\(subject) - \(selectedLevel?.rawValue ?? "")")
    }
}

struct VocabularyListView_Previews: PreviewProvider {
    static var previews: some View {
        VocabularyListView(subject: "Sample Subject", selectedLevel: .a1)
    }
}

struct Word {
    var question: String
    var choices: [String]
    var correctChoiceIndex: Int
}




