import SwiftUI

// MARK: Acronym View
struct AcronymView: View {
  // MARK: Properties
  @MainActor @State private var showAcronymSubmitSucceededAlert = false
  @MainActor @State private var showAcronymSubmitFailedAlert = false

  private let acronym = Acronym(short: "COOL", long: "Code only on land")

  // MARK: Body
  var body: some View {
    VStack {
      Image(systemName: "doc.text")
        .resizable()
        .frame(maxWidth: 90, maxHeight: 120)
        .padding(.bottom, 20)

      Button("Send Acronym") {
        print("Send Acronym tapped.")
      }
    }
    // swiftlint:disable all
    .alert("Successfully sent \(acronym.short) acronym",
      isPresented: $showAcronymSubmitSucceededAlert) {
      Button("Dismiss", role: .cancel) {
        showAcronymSubmitSucceededAlert = false
      }
    }
    .alert("Failed to send \(acronym.short) acronym",
      isPresented: $showAcronymSubmitFailedAlert) {
      Button("Dismiss", role: .cancel) {
        showAcronymSubmitFailedAlert = false
      }
    }
    // swiftlint:enable all
  }
}

// MARK: - Preview Provider
struct AcronymView_Previews: PreviewProvider {
  // MARK: Previews
  static var previews: some View {
    Group {
      AcronymView()
    }
  }
}
