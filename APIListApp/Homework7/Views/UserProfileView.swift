import SwiftUI

struct UserProfileView: View {
  var result: ResultModel
  @StateObject var userStore: UserStore

  var body: some View {
    NavigationView {
      List {
        Section(header: Text("User Information")) {
          if let profile = userStore.profile?.results.first {
            HStack {
              Text("Name")
              Spacer()
              Text("\(profile.name!.first) \(profile.name!.last)")
            }
            HStack {
              Text("Email")
              Spacer()
              Text("\(profile.email)")
            }
            HStack {
              Text("Phone")
              Spacer()
              Text("\(profile.phone)")
            }
          } else {
            Text("Data not available.")
          }
        }
      }
    }
  }
}

struct UserProfileView_Previews: PreviewProvider {
  static var previews: some View {
    let userStore = UserStore()
    return UserProfileView(result: ResultModel.example, userStore: userStore)
  }
}


