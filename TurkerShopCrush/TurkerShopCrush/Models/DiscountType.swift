//
//  DiscountType.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 6.05.2023.
//

import Foundation

enum DiscountType: String, CaseIterable {
    case defaultDiscount = "Default discount"
    case nationalDayDiscount = "National Day discount"
    case blackFridayDiscount = "Black Friday discount"
    case newYearDiscount = "New year discount"
    
    var discountPercentage: Double {
        switch self {
        case .defaultDiscount:
            return 5.0
        case .nationalDayDiscount:
            return 10.0
        case .blackFridayDiscount:
            return 15.0
        case .newYearDiscount:
            return 20.0
        }
    }
}

