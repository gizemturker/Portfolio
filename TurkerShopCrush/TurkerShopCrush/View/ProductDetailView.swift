//
//  ProductDetailView.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 19.05.2023.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    // for matched geometry effect
    var animation: Namespace.ID
    
    // Shared Data Model
    @EnvironmentObject var sharedData: SharedDataModel
    
    @EnvironmentObject var homeData: HomeViewModel
    
    var body: some View {
        
        VStack{
            // title bar and product image
            VStack{
                // title bar
                HStack{
                    Button{
                        // closing view
                        withAnimation(.easeInOut){
                            sharedData.showDetailProduct = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(isLiked() ? .red :
                                Color.black.opacity(0.7))
                            .offset(y: -100)
                            .offset(x: 20)
                            
                    }
                    
                    Spacer()
                    
                    Button {
                        addToLiked()
                    } label: {
                        Image("Liked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color.black.opacity(0.7))
                            .offset(y: -100)
                            .offset(x: 300)
                            .frame(maxHeight: .infinity)
                            
                    }

                    
                    .padding()
                    
                    // Product Image
                    // adding matched geometry effect
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)\(sharedData.fromSearchPage ? "SEARCH" : "IMAGE")", in: animation)
                        .padding(.horizontal)
                        .offset(y: 30)
                        .offset(x: -40)
                       
                      
                    
                    
                }
                
            }
            .frame(height: getRect().height / 1.8)
            .zIndex(1)
            
            
            // product details
            ScrollView(.vertical, showsIndicators: false){
                
                // product data
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(product.title)
                        .font(.custom(customFont, size: 20).bold())
                    Text(product.subtitle)
                        .font(.custom(customFont, size: 18))
                        .foregroundColor(.gray)
                    
                    Text("Get Apple TV + free for a year")
                        .font(.custom(customFont, size: 16).bold())
                        .padding(.top)
                    
                    Text ("Available when you purchase any new iPhone, iPad, iPod Touch,Mac or Apple TV, £4.99/month after free trial.")
                            .font(.custom(customFont, size: 15))
                            .foregroundColor(.gray)
                    
                    Button {
                        
                    } label: {
                        // since we need image at right
                        
                        Label{
                            Image(systemName: "arrow.right")
                        } icon: {
                            Text("Full description")
                        }
                        .font(.custom(customFont, size: 15).bold())
                        .foregroundColor(Color("Pink"))
                    }
                    
                    HStack {
                        
                        Text("Total")
                            .font(.custom(customFont, size: 17))
                        
                        Spacer()
                        
                        Text("\(product.price)")
                            .font(.custom(customFont, size: 20).bold())
                            .foregroundColor(Color("Pink"))
                    }
                    .padding(.vertical,20)
                    
                    // add button
                    
                    Button {
                        addToCart()
                    } label: {
                        Text("\(isAddedToCart() ? "added" : "add") to basket")
                            .font(.custom(customFont, size: 20).bold())
                            .foregroundColor(.white)
                            .padding(.vertical,20)
                            .frame(maxWidth: .infinity)
                            .background(
                            
                            Color("Pink")
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.06),radius: 5, x: 5, y: 5)
                            )
                    }
      
                }
                .padding([.horizontal, .bottom], 20)
                .padding(.top, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                // corner radius for only top side
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
                    .ignoresSafeArea()
            )
            .zIndex(0)
            .background(Color("HomeBG"))
            .frame(height: getRect().height / 0.7)

            
        }
        .animation(.easeInOut, value: sharedData.likedProducts)
        .animation(.easeInOut, value: sharedData.cartProducts)
        .background(Color("HomeBG"))
    }
    
    func isLiked()->Bool{
        return sharedData.likedProducts.contains { product in
            return self.product.id == product.id
            
        }
    }
    
    func isAddedToCart()->Bool{
        return sharedData.cartProducts.contains { product in
            return self.product.id == product.id
            
        }
    }

    
    func addToLiked(){
        if let index = sharedData.likedProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }){
            // remove from liked
            sharedData.likedProducts.remove(at: index)
        }
        else {
            // add to liked
            sharedData.likedProducts.append(product)
        }
    }
    
    func addToCart() {
        if let index = sharedData.cartProducts.firstIndex(where: { product in
            return self.product.id == product.id
        }) {
            // remove from liked
            sharedData.cartProducts.remove(at: index)
    }
        else {
            // add to liked
            sharedData.cartProducts.append(product)
        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // sample product from building preview
  //      ProductDetailView(product: HomeViewModel().products[0])
 //        .environmentObject(SharedDataModel())
        
        MainPage()
    }
}
