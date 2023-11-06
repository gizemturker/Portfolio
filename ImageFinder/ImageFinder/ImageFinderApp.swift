//
//  ImageFinderApp.swift
//  ImageFinder
//
//  Created by Gizem Turker on 29.10.2023.
//

import SwiftUI

@main
struct ImageFinderApp: App {
    @StateObject var imageManager = ImageManager()
    var body: some Scene {
        WindowGroup {
            ImageLayoutView()
        }
    }
}
