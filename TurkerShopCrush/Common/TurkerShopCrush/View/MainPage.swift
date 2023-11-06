//
//  MainPage.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 6.05.2023.
//

import SwiftUI

struct MainPage: View {
    
    // Current tab
    @State var currentTab: Tab = .Home
    
    
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    
    // animation namespace
    @Namespace var animation
    // hiding tb
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        VStack(spacing: 0){
            
            TabView(selection: $currentTab){
                
                Home(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
                
                LikedPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Liked)
                
                ProfilePage()
                    .tag(Tab.Profile)
                
                CartPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Cart)
            }
            
            // custom tabbar
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases,id: \.self) { tab in
                    
                    Button {
                        // updating tab
                        currentTab = tab
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                        // apply little shadow
                            .background(
                                Color("Pink")
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                // bluring
                                    .blur(radius: 5)
                                // little big size
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("Pink") : Color.black.opacity(0.3))
                    }

                }
                
                .padding([.horizontal, .bottom])
                .padding(.bottom, 10)
            }
            .background(Color("HomeBG").ignoresSafeArea())
            .overlay(
            
                ZStack{
                    // detail page
                    if let product = sharedData.detailProduct,sharedData.showDetailProduct{
                        
                        ProductDetailView(product: product, animation: animation)
                            .environmentObject(sharedData)
                        
                        // adding transitions
                        
                            .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                    }
                }
            
            )
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// making case iterateable
// Tab Cases

enum Tab: String, CaseIterable {
    
    // Raw value = img name
    
    case Home = "Home"
    case Liked = "Liked"
    case Profile = "Profile"
    case Cart = "Cart"
}
