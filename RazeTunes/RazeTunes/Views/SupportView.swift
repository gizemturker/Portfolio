import SwiftUI

// MARK: Support View
struct SupportView: View {
  // MARK: Properties
  @State private var chatMessage = ""
  @State private var messages: [String] = []
  // swiftlint:disable:next implicitly_unwrapped_optional
  @State private var webSocketTask: URLSessionWebSocketTask!

  // MARK: Body
  var body: some View {
    VStack {
      HStack {
        TextField("Enter a message", text: $chatMessage)
          .padding([.leading, .top, .bottom])

        Button("Send", action: sendMessageTapped)
          .padding(.trailing)
      }

      List(messages, id: \.self) { message in
        Text(message)
      }
      .onAppear(perform: setUpSocket)
      .onDisappear(perform: closeSocket)
    }
  }

  // MARK: Functions
  func closeSocket() {
    webSocketTask.cancel(with: .goingAway, reason: nil)

    messages = []
  }

  func listenForMessages() {
    webSocketTask.receive { result in
      switch result {
      case .failure(let error):
        print("Failed to receive message: \(error)")

      case .success(let message):
        switch message {
        case .string(let text):
          messages.insert(text, at: 0)

        case .data(let data):
          print("Received binary message: \(data)")

        @unknown default:
          fatalError("Listening for messages failed.")
        }

        listenForMessages()
      }
    }
  }

  func sendMessageTapped() {
    let message = URLSessionWebSocketTask.Message.string(self.chatMessage)

    webSocketTask.send(message) { error in
      if let error = error {
        print(error.localizedDescription)
      }
    }
  }

  func setUpSocket() {
    // swiftlint:disable:next force_unwrapping
    let webSocketURL = URL(string: "ws://localhost:8080/chat")!
    webSocketTask = URLSession.shared.webSocketTask(with: webSocketURL)

    listenForMessages()

    webSocketTask.resume()
  }
}

// MARK: - Preview Provider
struct SupportView_Previews: PreviewProvider {
  // MARK: Previews
  static var previews: some View {
    SupportView()
  }
}
