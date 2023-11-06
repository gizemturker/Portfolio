import SwiftUI
import WebKit

// MARK: Web View
struct WebView: UIViewRepresentable {
  // MARK: Properties
  let url: URL

  // MARK: Functions
  func makeUIView(context: Context) -> WKWebView {
    let request = URLRequest(url: url)

    let webView = WKWebView()
    webView.load(request)

    return webView
  }

  func updateUIView(_ uiView: WKWebView, context: Context) {
  }
}
