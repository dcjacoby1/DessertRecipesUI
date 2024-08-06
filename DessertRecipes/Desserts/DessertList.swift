//
//  DessertList.swift
//  DessertRecipes
//
//  Created by a on 8/5/24.
//

import SwiftUI

struct DessertList: View {
    
    @State private var desserts: [Dessert]?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(desserts ?? []) { dessert in
                    NavigationLink(destination: DessertDetail(dessertId: dessert.id)) {
                        DessertRow(dessert: dessert)
                    }
                }
            }
            .navigationTitle("Desserts")
        }
        .task {
            do {
                desserts = try await getDesserts()
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
    DessertList()
}
