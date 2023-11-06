//
//  QuizViewModel.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 29.09.2023.
//

import Foundation

import Foundation
import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var userChoseCorrectly = false
    
    var questions: [Question] = [
        Question(word: "Word1", choices: ["Meaning 1", "Meaning 2", "Meaning 3"], correctChoiceIndex: 0),
        Question(word: "Word2", choices: ["Meaning 1", "Meaning 2", "Meaning 3"], correctChoiceIndex: 1),
        Question(word: "Word3", choices: ["Meaning 1", "Meaning 2", "Meaning 3"], correctChoiceIndex: 2)
    ]
    
   
    
    func moveToNextQuestion() {
        if userChoseCorrectly {
            currentQuestionIndex += 1
            userChoseCorrectly = false
        }
    }
}
