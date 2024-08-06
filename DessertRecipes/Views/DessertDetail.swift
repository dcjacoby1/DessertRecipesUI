//
//  DessertDetail.swift
//  DessertRecipes
//
//  Created by a on 8/5/24.
//

import SwiftUI

struct DessertDetail: View {
    
    @State private var recipe: Recipe?
    var dessertId: String

    var body: some View {
        
        ScrollView{
            if let recipe = recipe {
                VStack(alignment: .center, spacing: 8) {
                    Text(recipe.name)
                        .font(.largeTitle)
                    Spacer()
            if let url = URL(string: recipe.image) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .frame(width: 200, height: 200)
                .frame(maxWidth: .infinity)
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 4))
                .shadow(radius: 7)
            }
            Spacer()
            Text("Instructions")
                .font(.headline)
            Text(recipe.instructions)
                .padding(.vertical)
                }
                .padding()
                               
            VStack(alignment: .leading, spacing: 8) {
                Text("Ingredients")
                    .font(.headline)
                Spacer()
                                   
                ForEach(recipe.ingredients, id: \.ingredient) { ingredient in Text("\(ingredient.ingredient): \(ingredient.measure)")
                }
            }
            .padding(.bottom, 16)
                
            } else {
                Text("Loading...")
            }
        }
        .task {
            do {
                recipe = try await getRecipe(for: dessertId)
            } catch APIError.invalidURL{
                print("invalid URL")
            } catch APIError.invalidResponse{
                print("invalid response")
            } catch APIError.invalidData{
                print("invalid data")
            } catch {
                print("error")
            }
        }
    }
}

#Preview {
    DessertDetail(dessertId: "53049")
}
