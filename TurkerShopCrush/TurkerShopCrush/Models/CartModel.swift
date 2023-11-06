//
//  CartModel.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 18.04.2023.
//

import Foundation

struct CartModel {
    
    var products: [Product] = []
    
    mutating func addProduct(_ product: Product) {
        products.append(product)
    }
    
    mutating func removeProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
        }
    }
    
  
    
    typealias DiscountCalculator = (Double, String) -> Double
    
    func calculateTotalAmountAfterDiscount(totalAmount: Double, discountType: String) -> Double {
        let discountTypes = DiscountType.allCases.reduce(into: [:]) { $0[$1.rawValue] = $1.discountPercentage }
        
        var discountPercentage = discountTypes[discountType] ?? 5.0
        
        let discountedAmount = totalAmount * discountPercentage / 100.0
        let totalAmountAfterDiscount = totalAmount - discountedAmount
        return totalAmountAfterDiscount
    }
}
