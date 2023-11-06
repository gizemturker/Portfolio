//
//  Food.swift
//  NewRwcipeApp
//
//  Created by Gizem Turker on 9.08.2022.
//

import Foundation


struct Recipe : Codable {
    
    let id:Int?
    let name:String?
    let description:String?
    let preparing_time:Int?
    let cooking_time:Int?
    let serving_size:Int?
    let calorie:Int?
    let county:Int?
    let categories:[Category]?
    let diets:[Diet]?
    
}

