//
//  OnePieceWalpaperApp.swift
//  OnePieceWalpaper
//
//  Created by Gizem Turker on 31.08.2023.
//

import GoogleMobileAds
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {

    GADMobileAds.sharedInstance().start()

    return true
  }
}

@main
struct OnePieceWalpaperApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomePageView()
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
