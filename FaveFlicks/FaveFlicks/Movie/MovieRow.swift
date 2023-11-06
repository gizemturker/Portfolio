//
//  MovieRow.swift
//  FaveFlicks
//
//  Created by Gizem Turker on 30.09.2023.
//

import SwiftUI

struct MovieRow: View {
  let movie: Movie
    @ObservedObject var lookAndFeelStore: LookAndFeelStore

  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      VStack(alignment: .leading) {
        Text(movie.title)
          .font(.title2)
          .fontWeight(.light)
        Text(movie.genre.rawValue)
          .font(.caption)
          .foregroundColor(.secondary)
      }

      Spacer()

      VStack(alignment: .trailing) {
          RatingView(lookAndFeelStore: lookAndFeelStore, rating: movie.rating)
      }
    }
  }
}
