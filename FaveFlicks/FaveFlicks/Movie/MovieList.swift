//
//  MovieList.swift
//  FaveFlicks
//
//  Created by Gizem Turker on 30.09.2023.
//

import SwiftUI

struct MovieList: View {
  @StateObject var movieStore = MovieStore()
  @State private var isPresented = false
  @State private var isLookAndFeelPresented = false
  @ObservedObject var userStore = UserStore()
  @ObservedObject var lookAndFeelStore = LookAndFeelStore()

  var body: some View {
    NavigationView {
      List {
        ForEach(movieStore.movies, id: \.title) {
          MovieRow(movie: $0, lookAndFeelStore: lookAndFeelStore)
        }
      }
      .sheet(isPresented: $isPresented) {
        AddMovie(movieStore: movieStore, showModal: $isPresented, lookAndFeelStore: lookAndFeelStore)
      }
      .sheet(isPresented: $isLookAndFeelPresented) {
          LookAndFeelView(lookandFeelStore: lookAndFeelStore)
      }
      .navigationBarTitle(Text("Fave Flicks"))
      .navigationBarItems(
        leading:
          NavigationLink(destination: UserView(userStore: userStore)) {
            HStack {
              Text(userStore.currentUserInfo.userName)
              Image(systemName: "person.fill")
            }
          },
        trailing:
          HStack {
            Button(action: { isLookAndFeelPresented.toggle() }) {
              Image(systemName: "gear")
            }
            Button(action: { isPresented.toggle() }) {
              Image(systemName: "plus")
            }
          }
      )
    }
    .accentColor(lookAndFeelStore.currentLookAndFeelInfo.accentColor)
  }
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList(movieStore: MovieStore())
  }
}
