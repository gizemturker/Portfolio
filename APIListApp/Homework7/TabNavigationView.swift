import SwiftUI

struct TabNavigationView: View {
  @StateObject var apiStore = APIStore()
  @StateObject var userStore = UserStore()
  
    var body: some View {
      TabView {
        APIListView(apiStore: apiStore)
          .tabItem {
            Label(
              Tab.list.title,
              systemImage: Tab.list.SFSymbol
            )
          }
          .tag(Tab.list)
        UserProfileView(result:
                          userStore.profile!.results.first!, userStore: self.userStore)
        .tabItem {
          Label(
            Tab.profile.title,
            systemImage: Tab.profile.SFSymbol
          )
        }
        .tag(Tab.profile)
      }
    }
}

#Preview {
    TabNavigationView()
}


enum Tab {
  case list, profile

  var title: String {
    switch self {
      case .list: return "List"
      case .profile: return "Profile"
    }
  }

  var SFSymbol: String {
    switch self {
      case .list: return "list.bullet"
      case .profile: return "person"
    }
  }
}
