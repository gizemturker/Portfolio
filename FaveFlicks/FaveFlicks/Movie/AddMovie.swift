//
//  AddMovie.swift
//  FaveFlicks
//
//  Created by Gizem Turker on 30.09.2023.
//

import SwiftUI

struct AddMovie: View {
  static let defaultMovieTitle = "An untitled masterpiece"

  let movieStore: MovieStore
  @Binding var showModal: Bool
  @State private var title = ""
  @State private var genre = Genre.action
  @State private var rating: Double = 0
    @ObservedObject var lookAndFeelStore: LookAndFeelStore

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Title")) {
          TextField("Title", text: $title)
        }
        Section(header: Text("Rating")) {
          Slider(value: $rating, in: 0...5, step: 0.5)
            RatingView(lookAndFeelStore: lookAndFeelStore, rating: rating)
        }
        Section(header: Text("Genre")) {
          GenrePicker(genre: $genre)
        }
      }
      .navigationBarTitle(Text("Add Movie"), displayMode: .inline)
      .navigationBarItems(
        trailing:
          Button(action: addMovie) {
            Text("Add")
          }
      )
    }
  }

  private func addMovie() {
    movieStore.addMovie(
      title: title.isEmpty ? AddMovie.defaultMovieTitle : title,
      genre: genre,
      rating: rating)

    showModal.toggle()
  }
}
