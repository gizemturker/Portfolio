//
//  HomePageView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 23.08.2023.
//

import SwiftUI

struct HomePageView : View {
    let categories = categoriesData

    var body: some View {
        NavigationView {
            List(categories) { category in
                            NavigationLink(destination: Text(category.name)) {
                    HStack {
                        Image(systemName: "person.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                            .frame(width: 30, height: 30)
                        Text(category.name)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Categories")
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
