import UIKit

// MARK: App Delegate
class AppDelegate: NSObject, UIApplicationDelegate {
  // MARK: Properties
  var backgroundCompletionHandler: (() -> Void)?

  // MARK: Application Delegate
  // swiftlint:disable all
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication
                                                                  .LaunchOptionsKey : Any]? = nil) -> Bool {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(backgroundSongDidDownload),
                                           name: MutableSongDownloader.BackgroundSongDownloadDidFinish,
                                           object: nil)

    return true
  }

  func application(_ application: UIApplication,
                   handleEventsForBackgroundURLSession identifier: String,
                   completionHandler: @escaping () -> Void) {
    // swiftlint:enable all
    print("URLSession identifier: \(identifier)")

    backgroundCompletionHandler = completionHandler
  }

  // MARK: Private Functions
  @objc private func backgroundSongDidDownload() {
    if let backgroundCompletionHandler = backgroundCompletionHandler {
      backgroundCompletionHandler()
    }
  }
}
