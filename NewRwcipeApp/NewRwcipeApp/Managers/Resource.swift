//
//  Resource.swift
//  NewRwcipeApp
//
//  Created by Gizem Turker on 13.08.2022.
//

import Foundation

struct Resource {
  let url: URL
  let path: String?
  let httpMethod: String
  let parameters: [String: String]

  init(url: URL, path: String? = nil, httpMethod: String = "GET", parameters: [String: String] = [:]) {
    self.url = url
    self.path = path
    self.httpMethod = httpMethod
    self.parameters = parameters
  }
}
