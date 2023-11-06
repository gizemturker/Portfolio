import SwiftUI

// MARK: Cookie View
struct CookieView: View {
  // MARK: Properties
  @State private var description: String?

  // MARK: Body
  var body: some View {
    VStack {
      Image(systemName: "mouth")
        .resizable()
        .frame(maxWidth: 120, maxHeight: 70)
        .padding(.bottom, 20)

      Text("\(description ?? "-")")
        .padding(20)

      Button("Get Cookies") {
        Task {
          await getCookiesTapped()
        }
      }
    }
  }

  // MARK: Functions
  private func getCookiesTapped() async {
    func setDescription(for cookies: [HTTPCookie]? = nil) {
      Task { @MainActor in
        guard let cookies = cookies else {
          description = "Cookies: N/A"

          return
        }
      }
    }

    // TODO: Challenge - Print Cookies From A Request

  }
}

// MARK: - Preview Provider
struct CookieView_Previews: PreviewProvider {
  // MARK: Previews
  static var previews: some View {
    CookieView()
  }
}
