//
//  RecipeListView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/25/21.
//

import SwiftUI

struct RecipeListView: View {
    @Binding var showRecipes: Bool
    
    var body: some View {
        NavigationView {
            List(recipeItems) { recipe in
                RecipeRow(recipe: recipe)
            }
            .navigationBarTitle(Text("Browse Recipes"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showRecipes.toggle()
                                    }, label: {
                                        Text("Done").bold()
                                    })
            )
        }
    }
}

