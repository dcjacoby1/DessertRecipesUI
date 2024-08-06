//
//  Dessert.swift
//  DessertRecipes
//
//  Created by a on 8/5/24.
//

import Foundation

struct Dessert: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
        
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case image = "strMealThumb"
    }
    
}

struct Desserts: Codable {
    let meals: [Dessert]
}
