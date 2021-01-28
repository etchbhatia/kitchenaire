//
//  RecipeRow.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/25/21.
//

import SwiftUI

struct ItemsRow: View {
    var items: Items
//    var title: String
//    var items: [Model]
    
    var body: some View {
        HStack {
            items.image
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
                .frame(width: 50)
            VStack (alignment: .leading) {
                Text(verbatim: "Step \(items.id)")
                Text(verbatim: "Look for \(items.name) in the \(items.locate)")
            }
            Spacer()
        }
    }
}

// TODO: call model method to async load modelEntity
// TODO: select model for placement
