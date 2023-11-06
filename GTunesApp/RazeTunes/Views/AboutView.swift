import SwiftUI

// MARK: About View
struct AboutView: View {
  var body: some View {
    NavigationView {
      VStack(spacing: 40) {
        WebSiteButtonView(
          color: .red,
          title: "objc.io",
          url: "https://www.objc.io")
        WebSiteButtonView(
          color: .green,
          title: "mokacoding",
          url: "http://www.mokacoding.com")
        WebSiteButtonView(
          color: .blue,
          title: "PBS",
          url: "http://www.pbs.org/video/2365356586/")
      }
    }
  }
}

// MARK: - Preview Provider
struct AboutView_Previews: PreviewProvider {
  // MARK: Previews
  static var previews: some View {
    AboutView()
  }
}
