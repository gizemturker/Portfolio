//
//  ContentView.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 10.04.2023.
//

import SwiftUI

struct ContentView: View {
    // Log status
    @AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
        Group{
            if log_Status{
                MainPage()
            }else{
                OnboardingPage()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
