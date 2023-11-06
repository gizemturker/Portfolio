import Foundation

// MARK: Acronym Sender
class AcronymSender {
  // MARK: Acronym Error
  enum AcronymError: Error {
    case failedToDecodeAuthToken
    case failedToEncodeAcronym
    case failedToEncodeUserCredentials
    case invalidAcronymResponse
    case invalidLoginResponse
  }

  // MARK: Properties
  private let session: URLSession
  private let sessionConfiguration: URLSessionConfiguration

  private let baseURL: URL
  private let loginEndpoint: URL
  private let newEndpoint: URL
  private let newUserEndpoint: URL

  // MARK: Initialization
  init() {
    self.sessionConfiguration = URLSessionConfiguration.default
    self.sessionConfiguration.waitsForConnectivity = true
    self.session = URLSession(configuration: sessionConfiguration)

    // swiftlint:disable force_unwrapping
    self.baseURL = URL(string: "https://tilftw.herokuapp.com/")!
    self.loginEndpoint = URL(string: "login", relativeTo: baseURL)!
    self.newEndpoint = URL(string: "new", relativeTo: baseURL)!
    self.newUserEndpoint = URL(string: "users", relativeTo: baseURL)!
    // swiftlint:enable force_unwrapping
  }

  // MARK: Functions
  func send(acronym: Acronym, for user: User) async throws {
    let credentials = "\(user.email):\(user.password)"

    guard let data = credentials.data(using: .utf8) else {
      throw AcronymError.failedToEncodeUserCredentials
    }

    let encodedString = data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))

    var loginRequest = URLRequest(url: loginEndpoint)
    loginRequest.httpMethod = "POST"
    loginRequest.allHTTPHeaderFields = [
      "accept": "application/json",
      "content-type": "application/json",
      "authorization": "Basic \(encodedString)"
    ]

    let (loginData, loginResponse) = try await session.data(for: loginRequest)

    guard let httpLoginResponse = loginResponse as? HTTPURLResponse,
      httpLoginResponse.statusCode == 200
    else {
      throw AcronymError.invalidLoginResponse
    }

    var auth = Auth(token: "")

    do {
      auth = try JSONDecoder().decode(Auth.self, from: loginData)
    } catch {
      throw AcronymError.failedToDecodeAuthToken
    }

    var acronymRequest = URLRequest(url: newEndpoint)
    acronymRequest.httpMethod = "POST"
    acronymRequest.allHTTPHeaderFields = [
      "accept": "application/json",
      "content-type": "application/json",
      "authorization": "Bearer \(auth.token)"
    ]

    do {
      acronymRequest.httpBody = try JSONEncoder().encode(acronym)
    } catch {
      throw AcronymError.failedToEncodeAcronym
    }

    let (_, acronymResponse) = try await session.data(for: acronymRequest)

    guard let httpAcronymResponse = acronymResponse as? HTTPURLResponse,
      httpAcronymResponse.statusCode == 200
    else {
      throw AcronymError.invalidAcronymResponse
    }
  }
}
