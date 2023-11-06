//
//  EnglishLevels.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 27.09.2023.
//

import Foundation

struct EnglishLevels: Identifiable {
    var id = UUID()
    var levelName: String
    var themeName: String
}

let englishLevels: [EnglishLevels] = [
    EnglishLevels(levelName: "Level A1", themeName: "Newcomer's Quest"),
    EnglishLevels(levelName: "Level A2", themeName: "Apprentice's Journey"),
    EnglishLevels(levelName: "Level B1", themeName: "Word Explorer"),
    EnglishLevels(levelName: "Level B2", themeName: "Lexicon Master"),
    EnglishLevels(levelName: "Level C1", themeName: "Vocabulary Virtuoso"),
    EnglishLevels(levelName: "Level C2", themeName: "Language Maestro")
]


