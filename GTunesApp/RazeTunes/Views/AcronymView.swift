import SwiftUI

// MARK: Acronym View
struct AcronymView: View {
  // MARK: Properties
  @State private var showAcronymSubmitSucceededAlert = false
  @State private var showAcronymSubmitFailedAlert = false

  private let acronym = Acronym(short: "COOL", long: "Code only on land")
  private let sender = AcronymSender()
  private let user = User(email: "jo@razeware.com", name: "jo", password: "password")

  // MARK: Body
  var body: some View {
    VStack {
      Image(systemName: "doc.text")
        .resizable()
        .frame(maxWidth: 90, maxHeight: 120)
        .padding(.bottom, 20)

      Button("Send Acronym") {
        Task {
          await sendAcronymTapped()
        }
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

  // MARK: Functions
  private func sendAcronymTapped() async {
    do {
      try await sender.send(acronym: acronym, for: user)

      Task { @MainActor in
        showAcronymSubmitSucceededAlert = true
      }
    } catch {
      Task { @MainActor in
        showAcronymSubmitFailedAlert = true
      }
    }
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
