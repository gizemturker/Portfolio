//
//  Networking.swift
//  NewRwcipeApp
//
//  Created by Gizem Turker on 13.08.2022.
//

import Foundation

protocol Networking {

  @discardableResult func fetch(resource: Resource, completion: @escaping (Data?) -> Void) -> URLSessionTask?
}

