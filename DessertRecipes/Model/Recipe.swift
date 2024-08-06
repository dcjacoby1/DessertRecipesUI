//
//  Recipe.swift
//  DessertRecipes
//
//  Created by a on 8/6/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let id: String
    let name: String
    let instructions: String
    let image: String
    let ingredients: [(ingredient: String, measure: String)]
    

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case image = "strMealThumb"
        
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        instructions = try container.decode(String.self, forKey: .instructions)
        image = try container.decode(String.self, forKey: .image)
        
        var ingredients: [(ingredient: String, measure: String)] = []
        
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        for i in 1...20 {
            let ingredientKey = DynamicCodingKeys(stringValue: "strIngredient\(i)")!
            let measureKey = DynamicCodingKeys(stringValue: "strMeasure\(i)")!
            

            let ingredient = try dynamicContainer.decodeIfPresent(String.self, forKey: ingredientKey)
            let measure = try dynamicContainer.decodeIfPresent(String.self, forKey: measureKey)
            
            if let ingredient = ingredient, !ingredient.isEmpty,
               let measure = measure, !measure.isEmpty {
                ingredients.append((ingredient: ingredient, measure: measure))
            } else {
                self.ingredients = ingredients
                return
            }
        }
        self.ingredients = ingredients

    }
    struct DynamicCodingKeys: CodingKey {
            var stringValue: String
            var intValue: Int? { return nil }
            
            init?(stringValue: String) {
                self.stringValue = stringValue
            }
            
            init?(intValue: Int) {
                return nil
            }
        }
}

struct RecipeContainer: Codable {
    let meals: [Recipe]
}
