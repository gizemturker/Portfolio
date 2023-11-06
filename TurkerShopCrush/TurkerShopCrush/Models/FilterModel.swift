//
//  FilterModel.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 18.04.2023.
//

import Foundation

struct Filter {
    var products: [Product] = []
    enum Category: String {
        case electronics = "Electronics"
        case clothing = "Clothing"
        case beauty = "Beauty"
        case homeAndKitchen = "Home & Kitchen"
    }
    
    let categories: [Category] = [.electronics, .clothing, .beauty, .homeAndKitchen]
    
 
}
