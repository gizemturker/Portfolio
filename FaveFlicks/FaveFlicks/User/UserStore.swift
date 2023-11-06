//
//  UserStore.swift
//  FaveFlicks
//
//  Created by Gizem Turker on 30.09.2023.
//
import Combine

class UserStore: ObservableObject {
    @Published var currentUserInfo = UserInfo(userName: "Movie Lover", favoriteGenre: .action)
}
struct UserInfo {
  let userName: String
  let favoriteGenre: Genre
}
