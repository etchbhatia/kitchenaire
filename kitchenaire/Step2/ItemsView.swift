//
//  ItemsView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/24/21.
//

import SwiftUI

struct ItemsView: View {
    @Binding var showItems: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                // Gridview for thumbnails
            }
            .navigationBarTitle(Text("Browse"), displayMode: .large)
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

struct HorizontalGrid: View {
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("Recipe")
                .font(.title).bold()
                .padding(.leading, 22)
                .padding(.top, 10)
        })
    }
    
}
