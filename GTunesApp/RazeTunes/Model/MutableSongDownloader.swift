import SwiftUI

// MARK: Mutable Song Downloader
class MutableSongDownloader: NSObject, ObservableObject {
  // MARK: Song Download Error
  enum SongDownloadError: Error {
    case documentDirectoryError
    case failedToStoreSong
    case invalidResponse
  }

  // MARK: State
  enum State {
    case paused
    case downloading
    case failed
    case finished
    case waiting
  }

  // MARK: Static Properties
  static let BackgroundSongDownloadDidFinish =
  NSNotification.Name(rawValue: "BackgroundSongDownloadDidFinish")

  // MARK: Properties
  @Published var downloadLocation: URL?
  @Published var downloadProgress: Float = 0

  private var downloadURL: URL?
  private var downloadTask: URLSessionDownloadTask?
  private var resumeData: Data?
  // swiftlint:disable:next implicitly_unwrapped_optional
  private var session: URLSession!

  var state: State = .waiting

  // MARK: Initialization
  override init() {
    super.init()

    let identifier = "com.raywenderlich.razeTunes.mutableSongDownloader"
    let configuration = URLSessionConfiguration.background(withIdentifier: identifier)

    print("CREATING SESSION WITH IDENTIFIER")

    session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
  }

  // MARK: Functions
  func cancel() {
    state = .waiting

    downloadTask?.cancel()

    Task {
      await MainActor.run {
        downloadProgress = 0
      }
    }
  }

  func downloadSong(at url: URL) {
    downloadURL = url

    downloadTask = session.downloadTask(with: url)
    downloadTask?.resume()

    state = .downloading
  }

  func pause() {
    // swiftlint:disable:next trailing_closure
    downloadTask?.cancel(byProducingResumeData: { data in
      Task {
        await MainActor.run {
          self.resumeData = data

          self.state = .paused
        }
      }
    })
  }

  func resume() {
    guard let resumeData = resumeData else {
      return
    }

    downloadTask = session.downloadTask(withResumeData: resumeData)
    downloadTask?.resume()

    state = .downloading
  }
}

// MARK: - URLSession Download Delegate
extension MutableSongDownloader: URLSessionDownloadDelegate {
  // swiftlint:disable all
  func urlSession(_ session: URLSession,
                  downloadTask: URLSessionDownloadTask,
                  didWriteData bytesWritten: Int64, totalBytesWritten: Int64,
                  totalBytesExpectedToWrite: Int64) {
    Task {
      await MainActor.run {
        downloadProgress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)

        print("Progress: \(downloadProgress)")
      }
    }
  }

  func urlSession(_ session: URLSession,
                  downloadTask: URLSessionDownloadTask,
                  didFinishDownloadingTo location: URL) {
    // swiftlint:enable all
    let fileManager = FileManager.default

    guard let documentsPath = fileManager.urls(
      for: .documentDirectory,
      in: .userDomainMask).first
    else {
      Task {
        await MainActor.run {
          state = .failed
        }
      }

      return
    }

    let lastPathComponent = downloadURL?.lastPathComponent ?? "Song.m4a"
    let destinationURL = documentsPath.appendingPathComponent(lastPathComponent)

    do {
      if fileManager.fileExists(atPath: destinationURL.path) {
        try fileManager.removeItem(at: destinationURL)
      }

      try fileManager.copyItem(at: location, to: destinationURL)

      Task {
        await MainActor.run {
          downloadLocation = destinationURL

          state = .finished
        }
      }
    } catch {
      Task {
        await MainActor.run {
          state = .failed
        }
      }
    }
  }

  // swiftlint:disable all
  func urlSession(_ session: URLSession,
                  task: URLSessionTask,
                  didCompleteWithError error: Error?) {
    // swiftline:enable all
    Task {
      await MainActor.run {
        if let httpResponse = task.response as? HTTPURLResponse,
        httpResponse.statusCode != 200 {
          state = .failed
        }
      }
    }
  }

  func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
    Task { @MainActor in
      print("urlSessionDidFinishEvents called.")

      NotificationCenter.default.post(name: Self.BackgroundSongDownloadDidFinish, object: nil)
    }
  }
}
