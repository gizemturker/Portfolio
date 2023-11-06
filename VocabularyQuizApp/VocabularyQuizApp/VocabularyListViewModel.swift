//
//  VocabularyListViewModel.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 4.10.2023.
//

import Foundation

class VocabularyListViewModel: ObservableObject {
    @Published var words: [Word] = []
    @Published var currentQuestionIndex = 0
    @Published var selectedAnswerIndex: Int? = nil
    @Published var showCorrectAnswer = false

    
    func loadWords() {
        
        // Example:
        words = [
            Word(question: "What is the meaning of 'Elma'?", choices: ["Apple", "Banana", "Peach"], correctChoiceIndex: 0),
            Word(question: "What is the meaning of 'Muz'?", choices: ["Apple", "Banana", "Peach"], correctChoiceIndex: 1),
            Word(question: "What is the meaning of 'Şeftali'?", choices: ["Apple", "Banana", "Peach"], correctChoiceIndex: 2)
        ]
    }
    
    func submitAnswer(_ answerIndex: Int) {
        showCorrectAnswer = answerIndex == words[currentQuestionIndex].correctChoiceIndex
    }
    
    func moveToNextQuestion() {
        if currentQuestionIndex < words.count - 1 {
            currentQuestionIndex += 1
            selectedAnswerIndex = nil
            showCorrectAnswer = false
        }
    }
}
