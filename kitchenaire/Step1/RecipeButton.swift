//
//  RecipeButton.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/27/21.
//

import SwiftUI

struct RecipeButton: View {
    let recipe: Recipe
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                recipe.image
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(verbatim: recipe.name)
                Spacer()
            }
        }
    }
}

// TODO: call model method to async load modelEntity
// TODO: select model for placement
