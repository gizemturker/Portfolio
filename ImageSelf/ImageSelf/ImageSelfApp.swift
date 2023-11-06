//
//  ImageSelfApp.swift
//  ImageSelf
//
//  Created by Gizem Turker on 3.11.2023.
//

import SwiftUI

@main
struct ImageSelfApp: App {
    @StateObject var vm = HomeViewModel()
   
    var body: some Scene {
        WindowGroup {
            HomeView()
               
                .environmentObject(vm)
                             .onAppear {
                                 UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                             }
        }
    }
}
