//
//  ImageView.swift
//  ImageFinder
//
//  Created by Gizem Turker on 30.10.2023.
//

import SwiftUI

struct ImageView: View {
    var photo: Photo
    @StateObject var imageManager = ImageManager()
    var body: some View {
        ImageCard(photo: photo)
            .edgesIgnoringSafeArea(.all)
         
    }
}

#Preview {
    ImageView(photo: previewImage)
}
