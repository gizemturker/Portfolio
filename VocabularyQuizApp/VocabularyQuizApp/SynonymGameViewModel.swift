//
//  SynonymGameViewModel.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 4.10.2023.
//

import SwiftUI

class SynonymGameViewModel: ObservableObject {
    @Published var wordToFind = "Eloquent"
    @Published var options = ["Articulate", "Fluent", "Incoherent", "Proficient"]
    @Published var selectedOption: String? = nil
    @Published var isCorrect = false
    
    func checkAnswer(_ option: String) {
        selectedOption = option
        isCorrect = option == "Articulate" || option == "Proficient"
    }
    
    func resetQuestion() {
        selectedOption = nil
        isCorrect = false
    }
}

