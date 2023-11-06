//
//  DiscountProtocol.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 17.05.2023.
//

import SwiftUI
// Protocol Definition
protocol Discount {
    var discountType: String { get }
    var discountPercentage: Double { get }
    
    func calculateDiscount(originalPrice: Double) -> Double
}

// Class Conforming to the Protocol
class PercentageDiscount: Discount {
    let discountType: String
    let discountPercentage: Double
    
    init(discountType: String, discountPercentage: Double) {
        self.discountType = discountType
        self.discountPercentage = discountPercentage
    }
    
    func calculateDiscount(originalPrice: Double) -> Double {
        let discountAmount = originalPrice * (discountPercentage / 100)
        let discountedPrice = originalPrice - discountAmount
        return discountedPrice
    }
}

// Usage Example
let discount = PercentageDiscount(discountType: "Black Friday", discountPercentage: 15.0)
let originalPrice = 100.0
let discountedPrice = discount.calculateDiscount(originalPrice: originalPrice)
//print("Original Price: $\(originalPrice)")
//print("Discounted Price: $\(discountedPrice)")

    
