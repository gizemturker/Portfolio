import SwiftUI

// MARK: Rating Uploader
class RatingUploader: ObservableObject {
  // MARK: Rating Upload Error
  enum RatingUploadError: Error {
    case failedToCreateUploadData
    case failedToCreateUploadURL
    case invalidResponse
  }

  // MARK: Properties
  private let session: URLSession
  private let sessionConfiguration: URLSessionConfiguration

  // MARK: Initialization
  init() {
    self.sessionConfiguration = URLSessionConfiguration.default
    self.session = URLSession(configuration: sessionConfiguration)
  }

  // MARK: Functions
  func submit(rating: Int, for musicItem: MusicItem) async throws {
    guard let uploadURL = URL(string: "http://localhost:8080/upload") else {
      throw RatingUploadError.failedToCreateUploadURL
    }

    var request = URLRequest(url: uploadURL)
    request.httpMethod = "Post"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let json = """
    {
      "id": \(musicItem.id),
      "artistName": "\(musicItem.artistName)",
      "trackName": "\(musicItem.trackName)",
      "rating": \(rating)
    }
    """

    guard let uploadData = json.data(using: .utf8) else {
      throw RatingUploadError.failedToCreateUploadData
    }

    let (_, response) = try await session.upload(for: request, from: uploadData)

    guard let httpResponse = response as? HTTPURLResponse,
      httpResponse.statusCode == 200
    else {
      throw RatingUploadError.invalidResponse
    }
  }
}
