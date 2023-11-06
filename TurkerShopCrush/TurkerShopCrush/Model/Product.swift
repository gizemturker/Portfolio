//
//  Product.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 9.05.2023.
//

import SwiftUI


// ProductModel

struct Product: Identifiable, Hashable {
    
    var id = UUID() . uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String?
    var price: String 
    var productImage: String
    var quantity: Int
    
    init(id: String = UUID() . uuidString, type: ProductType, title: String, subtitle: String, price: String, productImage: String = "", quantity: Int = 1, description: String? = nil) {
        self.id = id
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.description = description ?? nil
        self.price = price
        self.productImage = productImage
        self.quantity = quantity
    }
}


// Product types

enum ProductType: String, CaseIterable {
    case Woman = "Woman"
    case Man = "Man"
    case Kids = "Kids"
    case Fashion = "Fashion"
    case XCollection = "XCollection"
    case SporOutdoor = "Spor & Outdoor"
    case HomeFurniture = "Home & Furniture"
    case BeautyPersonalCare = "Beauty & Personal Care"
    case ShoesBag = "Shoes & Bag"
    case Electronics = "Electronics"
    
    //....
    
}
// Discount Types

enum DiscountType: String {
    case `default` = "Default Discount"
    case nationalDay = "National Day Discount"
    case blackFriday = "Black Friday Discount"
    case newYear = "New Year Discount"
}

func printDiscount(for discountType: DiscountType) {
    switch discountType {
    case .default:
        print("Discount type: \(discountType.rawValue), Percentage: 5%")
    case .nationalDay:
        print("Discount type: \(discountType.rawValue), Percentage: 10%")
    case .blackFriday:
        print("Discount type: \(discountType.rawValue), Percentage: 15%")
    case .newYear:
        print("Discount type: \(discountType.rawValue), Percentage: 20%")
    }
}

// printDiscount(for: .default)

