//
//  RecipeListView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/25/21.
//

import SwiftUI

struct RecipeListView: View {
    @Binding var showRecipes: Bool
    @State private var showIs: Bool = false
    
    var body: some View {
        NavigationView {
            List(recipeItems) { recipe in
                RecipeButton(recipe: recipe) {
                    print("Recipe \(recipe.id) pressed.")
                }.sheet(isPresented: $showIs, content: {
                    ItemView(showIs: $showIs, recipe: recipe)
                })
                 
//                }.sheet(isPresented: $showItems, content: {
//                    ItemsListView(showItems:$showItems)
//                }) // TODO: debug this
                
            }
            .navigationBarTitle(Text("Select a Recipe"), displayMode: .large)
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

