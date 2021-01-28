//
//  ItemsListView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/24/21.
//

import SwiftUI

struct ItemsListView: View {
    @Binding var showItems: Bool
//    let models = Models()
    
    var body: some View {
        NavigationView {
            List(ItemsDB) { items in
                 ItemsRow(items: items)
            }
            .navigationBarTitle(Text("Browse Items"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showItems.toggle()
                                    }, label: {
                                        Text("Done").bold()
                                    })
            )
        }
    }
}

/*
struct ModelsByCat: View {
    let models = Models()
    
    var body: some View {
        ForEach(ModelCategory.allCases, id: \.self) {
            category in
        }
    }
}
*/
