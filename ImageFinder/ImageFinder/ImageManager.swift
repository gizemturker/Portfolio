//
//  ImageManager.swift
//  ImageFinder
//
//  Created by Gizem Turker on 30.10.2023.
//

import Foundation

enum Query: String, CaseIterable {
    case nature, cars, music, people, ocean, mountain, cooking
}

class ImageManager: ObservableObject {
    @Published private(set) var photos: [Photo] = []
    @Published var selectedQuery: Query = Query.people {
       
        didSet {
            Task.init {
                await findImages(topic: selectedQuery)
            }
        }
    }
    
    init() {
       
        Task.init {
            await findImages(topic: selectedQuery)
        }
    }
    

    func findImages(topic: Query) async {
        do {
       
            guard let url = URL(string: "https://api.pexels.com/v1/search?query=\(topic.rawValue)&per_page=10&orientation=portrait")
            else { fatalError("Missing URL") }
        
     
        var urlRequest = URLRequest(url: url)
            urlRequest.setValue(Bundle.main.infoDictionary?["API_KEY"] as? String, forHTTPHeaderField: "Authorization")
        
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
         
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(ResponseBody.self, from: data)

            DispatchQueue.main.async {
                self.photos = []
                self.photos = decodedData.photos
            }

        } catch {
            // If we run into an error, print the error in the console
            print("Error fetching data from Pexels: \(error)")
        }
    }
    
    func downloadImage(photo: Photo) {
          guard let url = URL(string: photo.src.original) else { return }
          
          URLSession.shared.dataTask(with: url) { data, response, error in
              guard let data = data, error == nil else { return }
              
              // Update UI on main queue
              DispatchQueue.main.async {
                  // Update the downloaded image
                  // For example, you can update the 'photo' object with the downloaded 'data'
                  // photo.downloadedImage = UIImage(data: data)
                  print("Image downloaded")
              }
          }.resume()
      }
}

struct ResponseBody: Decodable {
    var totalResults: Int
    var page: Int
    var perPage: Int
    var photos: [Photo]
    var nextPage: String
}

struct Photo: Identifiable, Decodable {
    var id: Int
    var url: String
    var src: Src
    var photographer: String


    struct Src: Decodable {
        var original: String
        var large2x: String
        var large: String
        var medium: String
        var small: String
        var portrait: String
        var landscape: String
        var tiny: String
    }
}
