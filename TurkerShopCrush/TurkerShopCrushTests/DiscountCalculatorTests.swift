//
//  DiscountCalculatorTests.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 20.05.2023.
//

import XCTest
@testable import TurkerShopCrush
class DiscountCalculatorTests: XCTestCase {

    func testTotalAmountAfterDiscount() {
        // Given
        let calculator = DiscountCalculator(itemPrices: [100.0, 200.0, 300.0], discountPercentage: 10.0)
        
        // When
        let totalAmountAfterDiscount = calculator.totalAmountAfterDiscount
        
        // Then
        XCTAssertEqual(totalAmountAfterDiscount, 540.0, accuracy: 0.001) // Assert the expected result with an accuracy of 0.001
    }
    
    func testCalculateDiscountedAmount() {
        // Given
        let calculator = DiscountCalculator(itemPrices: [100.0, 200.0, 300.0], discountPercentage: 10.0)
        
        // When
        let discountedAmount = calculator.calculateDiscountedAmount(discountPercentage: 10.0)
        
        // Then
        XCTAssertEqual(discountedAmount, 60.0, accuracy: 0.001) // Assert the expected result with an accuracy of 0.001
    }
    
    func testIncreaseItemPrices() {
        // Given
        let calculator = DiscountCalculator(itemPrices: [100.0, 200.0, 300.0], discountPercentage: 10.0)
        
        // When
        let increasedPrices = calculator.increaseItemPrices()
        
        // Then
        //XCTAssertEqual(increasedPrices, [150.0, 300.0, 450.0], accuracy: 0.001) // Assert the expected result with an accuracy of 0.001
    }
    
    func testGetSortedDiscounts() {
        // Given
        let calculator = DiscountCalculator(itemPrices: [100.0, 200.0, 300.0], discountPercentage: 10.0)
        
        // When
        let sortedDiscounts = calculator.getSortedDiscounts()
        
        // Then
        XCTAssertEqual(sortedDiscounts.count, 4) // Assert the expected count
        XCTAssertEqual(sortedDiscounts[0].0, .newYear) // Assert the expected discount type at index 0
        XCTAssertEqual(sortedDiscounts[0].1, 20.0, accuracy: 0.001) // Assert the expected discount percentage at index 0 with an accuracy of 0.001
    }

    // Add more unit tests as needed

}
