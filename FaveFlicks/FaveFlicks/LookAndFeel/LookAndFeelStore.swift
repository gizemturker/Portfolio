//
//  LookAndFeelStore.swift
//  FaveFlicks
//
//  Created by Gizem Turker on 30.09.2023.
//

import Combine
import SwiftUI
//TODO: Define a LookAndFeelStore class (what property wrapper should it have?)

class LookAndFeelStore: ObservableObject {
    @Published var currentLookAndFeelInfo = LookAndFeelInfo(accentColor: Color.blue, symbolName: "star")
}

//TODO: Make a LookAndFeelInfo struct that has an accentColor property and a symbolName property that is a string


struct LookAndFeelInfo {
    let accentColor: Color
    let symbolName: String
}
