//
//  TestViewModel.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 4.10.2023.
//

import Foundation

class TestViewModel: ObservableObject {
    // Define properties and methods relevant to your view here.
    
    // example:
    @Published var question: String = ""
    @Published var answer: String = ""
    
    func loadQuestion() {
        question = "What is the capital of France?"
    }
    
    func submitAnswer(_ userAnswer: String) {
        answer = "Correct!"
    }
}

