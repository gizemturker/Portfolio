//
//  WelcomeView.swift
//  HatayEarthquakeMemorial
//
//  Created by Gizem Turker on 15.04.2023.
//

import SwiftUI

struct WelcomeView: View {
    
    var page: Page
    var body: some View {

            VStack(spacing: 20) {
                Image("\(page.imageName)")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .cornerRadius(30)
                    .background(Color.gray.opacity(0.10))
                    .cornerRadius(10)
                    .padding()

                                
                Text(page.name)
                    .font(.title)
                    .multilineTextAlignment(.center)
                                
                Text(page.description)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .padding(20)
            }

    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(page: Page.storyPages.first!)
    }
}



