//
//  NetworkService.swift
//  NewRwcipeApp
//
//  Created by Gizem Turker on 13.08.2022.
//

import Foundation

final class NetworkService: Networking {
    private let session: URLSession
    

    
    

  init(configuration: URLSessionConfiguration = URLSessionConfiguration.default) {
    self.session = URLSession(configuration: configuration)
  }

  @discardableResult func fetch(resource: Resource, completion: @escaping (Data?) -> Void) -> URLSessionTask? {
    guard let request = makeRequest(resource: resource) else {
      completion(nil)
      return nil
    }

    let task = session.dataTask(with: request, completionHandler: { data, _, error in
      guard let data = data, error == nil else {
        completion(nil)
        return
      }

      completion(data)
    })

    task.resume()
    return task
  }


  private func makeRequest(resource: Resource) -> URLRequest? {
    let url = resource.path.map({ resource.url.appendingPathComponent($0) }) ?? resource.url
      print(url)
    guard let  component = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
      assertionFailure()
      return nil
    }
      
      print(component)

    guard let resolvedUrl = component.url else {
      assertionFailure()
      return nil
    }
      
      print(resolvedUrl)

    var request = URLRequest(url: resolvedUrl)
     // request.addValue("Bearer \(API_KEY)", forHTTPHeaderField: "Authorization")
    request.httpMethod = resource.httpMethod
      print(request)
    return request
  }
}
