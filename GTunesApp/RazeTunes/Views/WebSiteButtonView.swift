import SwiftUI

// MARK: Web Site Button View
struct WebSiteButtonView: View {
  // MARK: Properties
  let color: Color
  let title: String
  let url: String

  // MARK: Body
  var body: some View {
    ZStack {
      color

      // swiftlint:disable:next force_unwrapping
      NavigationLink(destination: WebView(url: URL(string: url)!).edgesIgnoringSafeArea(.top)) {
        Text(title)
          .font(.system(size: 25))
          .foregroundColor(.black)
          .fontWeight(.heavy)
      }
    }
    .frame(width: 300, height: 50, alignment: .center)
    .cornerRadius(10)
    .shadow(radius: 10)
  }
}

// MARK: - Preview Provider
struct WebSiteButton_Previews: PreviewProvider {
  // MARK: Previews
  static var previews: some View {
    WebSiteButtonView(
      color: .pink,
      title: "Apple",
      url: "https://apple.com")
  }
}
