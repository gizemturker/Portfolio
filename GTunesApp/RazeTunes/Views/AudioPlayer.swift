import AVKit
import SwiftUI

// MARK: Audio Player
struct AudioPlayer: UIViewControllerRepresentable {
  // MARK: Properties
  let songUrl: URL

  // MARK: Functions
  func makeUIViewController(context: Context) -> AVPlayerViewController {
    let player = AVPlayer(url: songUrl)
    let playerViewController = AVPlayerViewController()
    playerViewController.player = player

    return playerViewController
  }

  func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
  }
}
