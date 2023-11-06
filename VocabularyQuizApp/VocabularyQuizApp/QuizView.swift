//
//  QuizView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 22.08.2023.
//

import SwiftUI

struct QuizView: View {
    var subject: String
    var questions: [Question] = [
        Question(word: "Word1", choices: ["Meaning 1", "Meaning 2", "Meaning 3"], correctChoiceIndex: 0),
        Question(word: "Word2", choices: ["Meaning 1", "Meaning 2", "Meaning 3"], correctChoiceIndex: 1),
        Question(word: "Word3", choices: ["Meaning 1", "Meaning 2", "Meaning 3"], correctChoiceIndex: 2)
    ]
    
    @State private var currentQuestionIndex = 0
    @State private var userChoseCorrectly = false
    
    var body: some View {
      NavigationView {
        VStack {
            if currentQuestionIndex < questions.count {
                QuestionCard(question: questions[currentQuestionIndex], userChoseCorrectly: $userChoseCorrectly)
                    .padding()
            } else {
                Text("Quiz Completed!")
                    .font(.title)
                    .padding()
            }
            
            if currentQuestionIndex < questions.count {
                Button(action: {
                    if userChoseCorrectly {
                        currentQuestionIndex += 1
                        userChoseCorrectly = false
                    }
                }, label: {
                    Text("Next Question")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                .padding(.bottom)
            }
        }
        .navigationTitle(subject)
      }
    }
}

struct QuestionCard: View {
    var question: Question
    @Binding var userChoseCorrectly: Bool
    
    var body: some View {
        VStack {
            
            Text(question.word)
                .font(.headline)
            
            
            ForEach(0..<question.choices.count, id: \.self) { index in
                
                Button(action: {
                    userChoseCorrectly = (index == question.correctChoiceIndex)
                }, label: {
                    Text(question.choices[index])
                        .padding()
                        .background(userChoseCorrectly && index == question.correctChoiceIndex ? Color.green : Color.white)
                        .cornerRadius(10)
                })
                .padding(.bottom, 5)
            }
        }
    }
}

struct Question {
    var word: String
    var choices: [String]
    var correctChoiceIndex: Int
}


struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(subject: "Academic")
    }
}
