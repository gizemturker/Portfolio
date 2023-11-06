//
//  HomeViewModel.swift
//  TurkerShopCrush
//
//  Created by Gizem Turker on 9.05.2023.
//

import SwiftUI

// using combine to monitor search field and if user leaves for .5 secs then starts searching...
// to avoid memory issue

import Combine

class HomeViewModel: ObservableObject {
    
    @Published var productType: ProductType = .Woman
    // sample products
    @Published var products: [Product] = [
        
        Product (type: .Woman, title: "Shirt", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Woman, title: "Pants", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Woman, title: "Dress", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Woman, title: "Jean", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Woman, title: "Shoes", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Woman, title: "Suit", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Woman, title: "Shorts", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        
        Product (type: .Man, title: "Shirt", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Man, title: "Pants", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Man, title: "Dress", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Man, title: "Jean", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Man, title: "Shoes", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Man, title: "Suit", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        Product (type: .Man, title: "Shorts", subtitle: "White", price:"$59", productImage: "shirt", description: "test"),
        
        Product (type: .Electronics, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "AppleWatch6", description: "test"),
        Product (type: .Electronics, title: "Samsung Watch", subtitle: "Gear: Black", price:"$180", productImage: "SamsungWatch", description: "test"),
        Product (type: .Electronics, title: "Apple Watch", subtitle: "Series 4: Black", price: "$250", productImage: "AppleWatch4", description: "test"),
        Product (type: .Electronics, title: "iPhone 13", subtitle: "A15 - Pink", price: "$699",productImage: "iPhone12", description: "test"),
        Product (type: .Electronics, title: "iPhone 12", subtitle: "A14 - Blue", price: "$599", productImage: "iPhone12", description: "test"),
        Product (type: .Electronics, title: "iPhone 11", subtitle: "A13 - Purple", price:"$499",productImage: "iPhone11", description: "test"),
        Product (type: .Electronics, title: "iPhone SE 2", subtitle: "A13 - White", price: "$399", productImage: "iPhoneSE", description: "test"),
        Product (type: .Electronics, title: "MacBook Air", subtitle: "MI - Gold", price: "$999",productImage: "MacBookAir", description: "test"),
        Product (type: .Electronics, title: "iPad Pro", subtitle: "M - Silver", price: "$999", productImage: "iPadPro"), // nil week 2 // assigment 4
        
        
    ]
    
    // assignment 5-week02
    func addProducts(product: Product){
        products.append(product)
    }
    
    
    func printOptionalsNotNil(products: [Product]){
        
        for product in products {
         //   print(product)
            
            // assignment 6- week02
            if product.description != nil {
                print(product)
            }
        }
    }
    
    // Filtered Products...
    @Published var filteredProducts: [Product] = []
    
    // More product on the type
    
    @Published var showMoreProductsOnType: Bool = false
    
    // Serach data
    
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Product]?
    
    var searchCancellable: AnyCancellable?
    
    init(){
        // week02- assignment6
        printOptionalsNotNil(products: products)
        filterProductByType()
        // week02- assignment5
        addProducts(product: Product (type: .Electronics, title: "MacBook Pro", subtitle: "M1 - Space Grey", price: "$1299", productImage: "MacBookPro"))
        //print(products)
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != ""{
                    self.filterProductBySearch()
                }
                else{
                    self.searchedProducts = nil 
                }
            })
    }
    
    func filterProductByType(){
        
        // Filtering Product By Product Type...
        
        
        
        
        
        DispatchQueue.global(qos: .userInteractive) .async {
            let results = self.products
            // Since it will require more memory so were using lazy to perform more..
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
            // Limiting result.
                .prefix (4)
            DispatchQueue.main.async {
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
        
    }
    
    func filterProductBySearch(){
        
        // Filtering Product By Product Type...
        
        
        
        
        
        DispatchQueue.global(qos: .userInteractive) .async {
            let results = self.products
            // Since it will require more memory so were using lazy to perform more..
                .lazy
                .filter { product in
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }

            DispatchQueue.main.async {
                self.searchedProducts = results.compactMap({ product in
                    return product
                })
            }
        }
        
    }
}
