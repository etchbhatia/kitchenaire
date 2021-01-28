//
//  ItemView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/28/21.
//

import SwiftUI

struct ItemView : View {
    @Binding var showItems: Bool
    var item: Recipe.Item
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            ARViewContainer()
            ItemBar(item: item)
        })
        .edgesIgnoringSafeArea(.all)
    }
}

// TODO: put -1 in the last list item
// go to the next sheet until -1 is encountered


struct ItemBar: View {
    var item: Recipe.Item
    
    var body: some View {
        HStack {
            item.image
                .resizable()
                .frame(width: 50, height: 50)
            Spacer()
                .frame(width: 50)
            Text(verbatim: "Look for \(item.name) in the \(item.category)")
            Spacer()
        }
        .frame(maxWidth: 800)
        .padding(15)
        
    }
}
