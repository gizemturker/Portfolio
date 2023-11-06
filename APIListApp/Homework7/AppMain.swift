import SwiftUI

@main
struct AppMain: App {
  @StateObject var networkMonitor = NetworkMonitor()
  var body: some Scene {
    WindowGroup {
      TabNavigationView()
        .environmentObject(networkMonitor)
    }
  }
}
