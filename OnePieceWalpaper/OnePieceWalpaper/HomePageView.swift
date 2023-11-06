//  HomePageView.swift
//  OnePieceWalpaper
//
//  Created by Gizem Turker on 31.08.2023.
//

import SwiftUI
import Photos
import GoogleMobileAds
import StoreKit


struct HomePageView: View {
    
    private let items: [HomePageItem] = [
      .banner,
      .interstitial,
      .rewarded,
      .rewardedInterstitial,
    ]
    
    
    private let columns: [GridItem] = [
        GridItem(.fixed(180)),
        GridItem(.fixed(180))
    ]
    
    @State private var selectedImage: String? = nil
    @State private var bannerTapped = false
    
    var body: some View {
        NavigationView {
        ZStack {
            Image("backmap")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.clear)
                    .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight / 11)
                    .background(
                        VStack(alignment: .center, spacing: 5) {
                            Text("ONE PIECE ワンピース")
                                .font(.system(size: 24, weight: .bold))
                            Text("WALLPAPER")
                                .font(.system(size: 24, weight: .bold))

                        }
                    )
                
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(1...97, id: \.self) { index in
                            NavigationLink(
                                destination: ImageDetailView(imageName: "background-\(index)" ),
                                isActive: Binding<Bool>(
                                    get: { selectedImage == "background-\(index)" },
                                    set: { newValue in
                                        if !newValue {
                                            selectedImage = nil
                                        }
                                    }
                                )
                            ) {
                                Button(action: {
                                    selectedImage = "background-\(index)"
                                }) {
                                    Image("background-\(index)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(30)
                                        .clipped()
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }

                        
                    }
                    .padding(10)

                }
                
            }
            .navigationBarHidden(true)

                BannerContentView(navigationTitle: "")
                    .frame(width: UIScreen.screenWidth - 20)
                    .frame(height: UIScreen.screenHeight / 13)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.horizontal, 10)
                    .clipped()

    
        }
           
    }

       Spacer()

    }
    
}
}

struct ImageDetailView: View {
    let imageName: String
    @Environment(\.presentationMode) var presentationMode
    @State private var showAlert = false
    
    init(imageName: String) {
        self.imageName = imageName
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(10)
                         
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)

                Spacer()

                Button(action: {
                    if let image = UIImage(named: imageName) {
                        saveImageToPhotosAlbum(image)
                    }
                }) {
                    Image(systemName: "square.and.arrow.down")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(""),
                        message: Text(NSLocalizedString("photoSaved", comment: "")),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .frame(maxWidth: .infinity, alignment: .center)

            }
            .foregroundColor(Color.black)
            .padding()
        }
        
        .navigationBarHidden(true)
    }
    
    private func saveImageToPhotosAlbum(_ image: UIImage) {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }) { success, error in
            DispatchQueue.main.async {
                showAlert = true
            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomePageView()
        }
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

extension Color {
    static let transparentBlack = Color(UIColor.black.withAlphaComponent(0.5))
}
