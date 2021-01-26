//
//  RecipeView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/24/21.
// Depricated
//

import SwiftUI

struct RecipeView: View {
    @Binding var showRecipes: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                // Gridview for thumbnails
                VerticalGrid()
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


struct VerticalGrid: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recipe")
                .font(.title).bold()
                .padding(.leading, 22)
                .padding(.top, 10)
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(0..<5) {
                        Text("Item \($0)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(Color.black.opacity(0.25))
                    }
                }
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 10)
        }
    }
    
}
