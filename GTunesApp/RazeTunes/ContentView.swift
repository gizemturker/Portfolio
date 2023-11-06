import SwiftUI

// MARK: Content View
struct ContentView: View {
  // MARK: Body
  var body: some View {
    TabView {
      SongDetailView(musicItem: .constant(MusicItem.demo()))
        .tabItem {
          Image(systemName: "music.note")
          Text("Tunes")
        }

      SupportView()
        .tabItem {
          Image(systemName: "exclamationmark.bubble")
          Text("Support")
        }

      AcronymView()
        .tabItem {
          Image(systemName: "doc.text")
          Text("Acronyms")
        }

      AboutView()
        .tabItem {
          Image(systemName: "questionmark.circle")
          Text("About")
        }

      CookieView()
        .tabItem {
          Image(systemName: "mouth")
          Text("Cookies")
        }
    }
  }
}

// MARK: - Preview Provider
struct ContentView_Previews: PreviewProvider {
  // MARK: Previews
  static var previews: some View {
    ContentView()
  }
}
