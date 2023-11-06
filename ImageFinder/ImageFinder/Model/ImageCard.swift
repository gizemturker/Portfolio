//
//  ImageCard.swift
//  ImageFinder
//
//  Created by Gizem Turker on 30.10.2023.
//

import SwiftUI

struct ImageCard: View {
    var photo: Photo
   
    var body: some View {
            ZStack(alignment: .bottomLeading) {
                ZStack {
                    AsyncImage(url: URL(string: photo.src.large)) { large in
                        large.resizable()
                            .aspectRatio(contentMode: .fill)
     
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.3))
                            .frame(width: 160, height: 250)
                            .cornerRadius(30)
                          
                }
            }
                
                VStack(alignment: .leading) {
                    

                    Text(photo.photographer)
                        .font(.caption).bold()
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
                .shadow(radius: 20)
        
            }
      
    }
}

#Preview {
    ImageCard(photo: previewImage)
}
