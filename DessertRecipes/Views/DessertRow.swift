//
//  DessertList.swift
//  DessertRecipes
//
//  Created by a on 8/5/24.
//

import SwiftUI

struct DessertRow: View {
    var dessert: Dessert
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: dessert.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            Text(dessert.name)
            Spacer()
        }
    }
}

