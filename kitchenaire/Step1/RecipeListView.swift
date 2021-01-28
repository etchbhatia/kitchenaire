//
//  RecipeListView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/25/21.
//

import SwiftUI

struct RecipeListView: View {
    @Binding var showRecipes: Bool
    @Binding var showItems: Bool
    
    var body: some View {
        NavigationView {
            List(recipeItems) { recipe in
                RecipeButton(recipe: recipe) {
                    print("Recipe \(recipe.id) pressed.")
                    for item in recipe.items ?? [Recipe.Item]() {
                        print("Look for \(item.name) in the \(item.locate)")
                        }
                    for i in recipe.instructions ?? [Recipe.Instruction]() {
                        print("\(i.text)")
                        }
                    self.showItems.toggle()
                }
                /*
                }.sheet(isPresented: $showItems, content: {
                    ItemView(showItems: $showItems, item: recipe.items![0])
                })
                 */
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

