//
//  ImageLayoutView.swift
//  ImageFinder
//
//  Created by Gizem Turker on 30.10.2023.
//

import SwiftUI

struct ImageLayoutView: View {
    @StateObject var imageManager = ImageManager()
    
       var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
       
       var body: some View {
           NavigationView {
               VStack {
                   HStack {
                       ForEach(Query.allCases, id: \.self) { searchQuery in
                           QueryTags(query: searchQuery, isSelected: imageManager.selectedQuery == searchQuery)
                               .onTapGesture {
                                   imageManager.selectedQuery = searchQuery
                               }
                       }
                   }
                   
                   ScrollView {
                       if imageManager.photos.isEmpty {
                           ProgressView()
                       } else {
                           LazyVGrid(columns: columns, spacing: 20) {
                               ForEach(imageManager.photos , id: \.id) { photo in
                                   NavigationLink {
                                       ImageView(photo: photo)
                                   } label: {
                                       ImageCard(photo: photo)
                                   }
                               }
                           }
                           .padding()
                       }
                   }
                   .frame(maxWidth: .infinity)
               }
               
               .navigationBarHidden(true)
           }
       }
}

struct ImageLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        ImageLayoutView()
    }
}
