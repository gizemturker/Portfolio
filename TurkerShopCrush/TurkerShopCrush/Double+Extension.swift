//
//  Double+Extension.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 17.05.2023.
//

import SwiftUI

extension Double {
    func roundedOff() -> Double {
        let roundedValue = Int(self)
        let decimalValue = self - Double(roundedValue)
        if decimalValue >= 0.5 {
            return Double(roundedValue + 1)
        } else {
            return Double(roundedValue)
        }
    }
}

let totalDiscountedAmount = 50.6
let roundedAmount = totalDiscountedAmount.roundedOff()
// print("Rounded amount: \(roundedAmount)")
