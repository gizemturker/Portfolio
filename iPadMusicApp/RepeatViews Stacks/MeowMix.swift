//
//  MeowMix.swift
//  RepeatViews Stacks
//
//  Created by Gizem Turker on 30.09.2023.
//

import Foundation
import SwiftUI

struct Track: Identifiable {
    let id = UUID()
  let title: String
  let artist: String
  let duration: String
  
  let thumbnail = Image(systemName: "heart")
  let gradient: LinearGradient = {
    let colors: [Color] = [.orange, .pink, .purple, .red, .yellow]
    return LinearGradient(gradient: Gradient(colors: [colors.randomElement()!, colors.randomElement()!]), startPoint: .center, endPoint: .topTrailing)
  }()
}

struct MeowMix {
  let tracks = [
    Track(title: "Cool Cat", artist: "Keyboard Cat", duration: "0:29"),
    Track(title: "The Lovecats", artist: "The Cure", duration: "3:40"),
    Track(title: "Katamari on the Moog", artist: "Akitaka Tohyama, Yu Miyake", duration: "0:33"),
    Track(title: "A Sunday Morning Meditation", artist: "ambientcat", duration: "1:17"),
    Track(title: "Here Comes Santa Claws", artist: "Jingle Cats", duration: "2:21"),
    Track(title: "Be a Safe Rider", artist: "Safe-T Rider", duration: "5:05"),
    Track(title: "Jellicle Songs For Jellicle Cats", artist: "Andrew Lloyd Webber & 'Cats' 1983 Broadway Cast", duration: "5:17"),
    Track(title: "Cat Scratch Fever", artist: "Ted Nugent", duration: "3:37"),
    Track(title: "This Cat's On a Hot Tin Roof", artist: "The Brian Setzer Orchestra", duration: "2:55")
  ]
}
