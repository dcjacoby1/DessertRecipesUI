//
//  DessertAPI.swift
//  DessertRecipes
//
//  Created by a on 8/5/24.
//

import Foundation

func getDesserts() async throws -> [Dessert] {
    let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    guard let url = URL(string: endpoint) else {
        throw APIError.invalidURL
    }
            let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw APIError.invalidResponse
    }
    do {
        let decoder = JSONDecoder()
        let desserts = try decoder.decode(Desserts.self, from: data)
        return desserts.meals
    } catch {
        throw APIError.invalidData
    }
}

func getRecipe(for id: String) async throws -> Recipe {
    let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
    guard let url = URL(string: endpoint) else {
        throw APIError.invalidURL
    }
            let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw APIError.invalidResponse
    }
    do {
        let decoder = JSONDecoder()
        let recipeContainer = try decoder.decode(RecipeContainer.self, from: data)
        guard let recipe = recipeContainer.meals.first else {
                    throw APIError.invalidData
                }
        return recipe
    } catch {
        print("Decoding error: \(error)")
        throw APIError.invalidData
    }
}



enum APIError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
