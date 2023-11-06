//
//  Categories.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 27.09.2023.
//

import Foundation

struct Category: Identifiable, Codable {
    var id = UUID()
    var name: String
    var themeName: String
}

let categoriesData: [Category] = [
    Category(name: "Travel", themeName: "Wanderlust Adventures: Explore the World! 🌍🌟"),
    Category(name: "Daily Life", themeName: "Life Mastery Quests: Leveling Up Every Day! 💼🏆"),
    Category(name: "Academic", themeName: "Knowledge Knights: Scholarly Pursuits Unleashed! 📚🔮"),
    Category(name: "Business and Professional", themeName: "Career Champions: Thriving in the Work Realm! 💼🌟"),
    Category(name: "Health and Fitness", themeName: "Wellness Warriors: Conquer Fitness Challenges! 💪🎮"),
    Category(name: "Technology and Gadgets", themeName: "Gadget Gurus: Mastering Tech Treasures! 📱🛠️"),
    Category(name: "Entertainment and Media", themeName: "Fun Fusion: Unleash Your Inner Entertainer! 🎉📺"),
    Category(name: "Social Media and Internet", themeName: "Digital Dynamos: Navigating the Online World! 🌐🔥"),
    Category(name: "Programming and Development", themeName: "Code Conquerors: Crafting Digital Realms! 💻🚀")
]

