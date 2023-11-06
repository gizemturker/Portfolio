//
//  OnboardingViewModel.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 4.10.2023.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var currentPage: Int = 0
    
    func nextButtonTapped() {
        currentPage += 1
    }
    
    func getStartedButtonTapped() {
       
    }
}
