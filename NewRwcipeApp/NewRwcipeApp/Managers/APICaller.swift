//
//  APICaller.swift
//  NewRwcipeApp
//
//  Created by Gizem Turker on 9.08.2022.
//

import Foundation



final class APICaller {
    
    private let BASE_URL = URL(string: "https://stormy-taiga-44619.herokuapp.com/api")!
    
    private let networking: Networking

    init(networking: Networking) {
      self.networking = networking
    }
    
  func fetchRecipes(categoryId: String, completion: @escaping ([Recipe]?) -> Void) {
    let resource = Resource(url: BASE_URL, path: "/recipe", parameters: [
      "categoryId": categoryId
    ])

    _ = networking.fetch(resource: resource, completion: { data in
      DispatchQueue.main.async {
        completion(data.flatMap({ RecipeListResponse.make(data: $0)?.recipes }))
      }
    })
  }

}

private class RecipeListResponse: Decodable {
  let count: Int
  let recipes: [Recipe]

  static func make(data: Data) -> RecipeListResponse? {
      print("fdgsdfs")
      
      print(try? JSONDecoder().decode(RecipeResponse.self, from: data))

    return try? JSONDecoder().decode(RecipeListResponse.self, from: data)
  }
}

private class RecipeResponse: Decodable {
  let recipe: Recipe

  static func make(data: Data) -> RecipeResponse? {
    return try? JSONDecoder().decode(RecipeResponse.self, from: data)
  }

}

