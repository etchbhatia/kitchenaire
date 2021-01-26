//
//  RecipeRow.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/25/21.
//

import SwiftUI

struct RecipeRow: View {
  var recipe: Recipe
    var body: some View {
        HStack {
            recipe.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(verbatim: recipe.name)
            Spacer()
        }
    }
}

// TODO: call model method to async load modelEntity
// TODO: select model for placement
