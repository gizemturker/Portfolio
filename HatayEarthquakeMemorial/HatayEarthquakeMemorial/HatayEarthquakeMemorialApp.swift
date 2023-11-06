//
//  HatayEarthquakeMemorialApp.swift
//  HatayEarthquakeMemorial
//
//  Created by Gizem Turker on 11.04.2023.
//


import SwiftUI


class AppState: ObservableObject {
    @Published var isIntroFinished: Bool
    @Published var lastPage: Bool
    
    init(isIntroFinished: Bool, lastPage: Bool) {
        self.isIntroFinished = isIntroFinished
        self.lastPage = lastPage
        
    }
}

@main
struct HatayEarthquakeMemorialApp: App {
    
    @ObservedObject var appState = AppState(isIntroFinished: false, lastPage: false)
    
    @StateObject var locationsViewModel = LocationsViewModel()
    
    
    
    var body: some Scene {
        WindowGroup {
            if appState.isIntroFinished {
                LocationsView().environmentObject(locationsViewModel).environmentObject(appState)
            } else {
                ContentView().environmentObject(appState)
            }
            
            
            
        }
    }
}




