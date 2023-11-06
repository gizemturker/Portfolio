//
//  MovieStore.swift
//  FaveFlicks
//
//  Created by Gizem Turker on 30.09.2023.
//

import Foundation

class MovieStore: ObservableObject {
  static let moviesKey = "Movies"
  static let defaultMovies = [
    Movie(title: "A Cat in Paris", genre: .family, rating: 5),
    Movie(title: "Pet Sematary", genre: .horror, rating: 3.5),
    Movie(title: "The Cat Returns", genre: .animation, rating: 4)
  ]

  static func loadMovies() -> [Movie] {
    let savedMovies = UserDefaults.standard.object(forKey: MovieStore.moviesKey)
    if let savedMovies = savedMovies as? Data {
      let decoder = JSONDecoder()
      return (try? decoder.decode([Movie].self, from: savedMovies))
        ?? MovieStore.defaultMovies
    }
    return MovieStore.defaultMovies
  }

  @Published var movies = loadMovies() {
    didSet {
      persistMovies()
    }
  }

  func addMovie(title: String, genre: Genre, rating: Double) {
    let newMovie = Movie(title: title, genre: genre, rating: rating)
    movies.append(newMovie)
  }

  func deleteMovie(at offsets: IndexSet) {
    movies.remove(atOffsets: offsets)
  }

  private func persistMovies() {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(movies) {
      UserDefaults.standard.set(encoded, forKey: MovieStore.moviesKey)
    }
  }
}
