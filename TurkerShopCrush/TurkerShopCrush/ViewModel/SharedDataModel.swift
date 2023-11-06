//
//  SharedDataModel.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 19.05.2023.
//

import SwiftUI

class SharedDataModel: ObservableObject {
  
    // detail product data
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
    
    // matched geometry effect from search page
    @Published var fromSearchPage: Bool = false
    
    // liked products
    @Published var likedProducts: [Product] = []
    
    // basket products
    
    @Published var cartProducts: [Product] = []
    
    // calculating total price
    func getTotalPrice()->String{
        
        var total: Int = 0
        
        cartProducts.forEach { product in
            
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            total += priceTotal
        }
        
        return "$\(total)"
    }
}

