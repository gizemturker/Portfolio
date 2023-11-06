
import SwiftUI

class APIRequestHandler: ObservableObject {
    @Published var entries: APIModel?

    enum APIRequestError: Error {
        case networkError
        case dataNotFound
        case decodingError
        case invalidDataFormat
        case documentDirectoryError
        case failedToStoreAPI
    }

    private let session: URLSession

    init() {
        self.session = URLSession.shared
    }

    func fetchDataFromAPI(apiURL: URL, completion: @escaping (Result<APIModel, APIRequestError>) -> Void) {
        let task = URLSession.shared.dataTask(with: apiURL) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.networkError))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(APIModel.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
