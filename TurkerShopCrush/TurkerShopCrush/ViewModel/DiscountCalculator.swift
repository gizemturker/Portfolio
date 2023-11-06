//
//  DiscountCalculator.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 17.05.2023.
//

import Foundation

struct DiscountCalculator {
   
     let itemPrices: [Double]
     let discountPercentage: Double
    
    lazy var maximumDiscount: Double = {
          let maxDiscount = itemPrices.max() ?? 0.0
          return maxDiscount * 0.1 // Assuming 10% discount for maximum discount
      }()
     
     var totalAmountAfterDiscount: Double {
         let totalAmount = itemPrices.reduce(0, +)
         let discountedAmount = totalAmount * (discountPercentage / 100)
         return totalAmount - discountedAmount
     }
    
    func calculateDiscountedAmount(discountPercentage: Double) -> Double {
        let totalAmount = itemPrices.reduce(0) { $0 + $1 }
          let discountedAmount = totalAmount * (discountPercentage / 100)
          return totalAmount - discountedAmount
      }
    
    
    typealias DiscountCalculatorClosure = (Double, String) -> Double
    
    let calculateDiscount: DiscountCalculatorClosure = { totalAmount, discountType in
        var discountPercentage = 0.0
        
        switch discountType {
        case "Default":
            discountPercentage = 5.0
        case "National Day":
            discountPercentage = 10.0
        case "Black Friday":
            discountPercentage = 15.0
        case "New Year":
            discountPercentage = 20.0
        default:
            break
        }
        
        let discountedAmount = totalAmount * (discountPercentage / 100)
        let totalAmountAfterDiscount = totalAmount - discountedAmount
        print("Total amount after discount: \(totalAmountAfterDiscount)")
        return totalAmountAfterDiscount
    }
    
    
    func increaseItemPrices() -> [Double] {
        return itemPrices.map { $0 * 1.5 }
    }
    
    enum DiscountType: String {
        case `default` = "Default Discount"
        case nationalDay = "National Day Discount"
        case blackFriday = "Black Friday Discount"
        case newYear = "New Year Discount"
    }
    
    let discountPercentages: [DiscountType: Double] = [
        .default: 5.0,
        .nationalDay: 10.0,
        .blackFriday: 15.0,
        .newYear: 20.0
    ]
    
    func getSortedDiscounts() -> [(DiscountType, Double)] {
        return discountPercentages.sorted { $0.value > $1.value }
    }
    
}

let calculator = DiscountCalculator(itemPrices: [100.0, 200.0, 300.0], discountPercentage: 10.0)
// print("Current discounted amount: \(calculator.currentDiscountedAmount)")
// print("Maximum discount: \(calculator.maximumDiscount)")
