//
//  ItemView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/28/21.
//

import SwiftUI

struct ItemView : View {
    @Binding var showIs: Bool
    
    var recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            ARViewContainer()
            ItemBarView(showIs: $showIs, recipe: recipe)
        })
        .edgesIgnoringSafeArea(.all)
    }
}

// TODO: put -1 in the last list item
// go to the next sheet until -1 is encountered

struct ItemBarView : View {
    @Binding var showIs: Bool
    var recipe: Recipe
    
    var body: some View {
        VStack {
            ItemBar(showIs: $showIs,
                    title: "Point to" ,
                    items: recipe.getItems())
        }
    }
}

struct ItemBar: View {
    @Binding var showIs: Bool
    var title: String
    var items: [Recipe.Item]
    
    var body: some View {
        HStack {
            ForEach(items, id: \.self) {i in
//                Spacer()
                ItemButton(item: i, systemIconName: "4.circle.fill") {
                    print("Button x pressed.")
                    self.showIs.toggle()
                }
            }
        }
        .frame(maxWidth: 800)
        .padding(15)
        
    }
}


struct ItemButton: View {
    var item: Recipe.Item
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
/*
struct ItemButton: View {
    var item: Recipe.Item
    var image: Image
    
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            image
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 50, height: 50)
    }
}
*/
