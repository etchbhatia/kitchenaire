//
//  ControlView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/24/21.
//

import SwiftUI

struct ControlView: View {
    @Binding var showRecipes: Bool
    @Binding var showItems: Bool
    @Binding var showInstructions: Bool
    
    var body: some View {
        VStack {
            ControlButtonBar(showRecipes: $showRecipes,
                             showItems: $showItems,
                             showInstructions: $showInstructions)
        }
    }
}

struct ControlButtonBar: View {
    @Binding var showRecipes: Bool
    @Binding var showItems: Bool
    @Binding var showInstructions: Bool
    
    var body: some View {
        HStack {
            /// Choose Recipe Button
            Spacer()
            ControlButton(systemIconName: "1.circle.fill") {
                print("Button 1 pressed.")
                self.showRecipes.toggle()
            }.sheet(isPresented: $showRecipes, content: {
                RecipeListView(showRecipes:$showRecipes, showItems:$showItems)
            })
            /// Find Items Button
            Spacer()
            ControlButton(systemIconName: "2.circle.fill") {
                print("Button 2 pressed.")
                self.showItems.toggle()
            }.sheet(isPresented: $showItems, content: {
                ItemsListView(showItems:$showItems)
            })
            /// Instructions Button
            Spacer()
            ControlButton(systemIconName: "3.circle.fill") {
                print("Button 3 pressed.")
            }
//            }.sheet(isPresented: $showItems, content: {
//                ItemsView(showItems:$showItems)
//            })
            Spacer()
        }
        .frame(maxWidth: 800)
        .padding(15)
        
    }
}


struct ControlButton: View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 50, height: 50)
    }
}
