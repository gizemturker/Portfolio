//
//  UserProfileViewModel.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 29.09.2023.
//


import Foundation
import SwiftUI

class UserProfileViewModel: ObservableObject {
    @Published var username: String
    @Published var email: String
    @Published var achievements: [String]
    @Published var profileImage: Image? = Image(systemName: "person.circle.fill")
    
    init(username: String, email: String, achievements: [String]) {
        self.username = username
        self.email = email
        self.achievements = achievements
    }
    
  
    func changeProfileImage(image: Image) {
        self.profileImage = image
    }
}
