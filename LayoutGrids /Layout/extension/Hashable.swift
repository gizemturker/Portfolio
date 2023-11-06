//
//  Hashable.swift
//  Layout
//
//  Created by Gizem Turker on 30.09.2023.
//

public extension Hashable where Self: Identifiable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
