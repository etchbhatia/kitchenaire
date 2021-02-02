//
//  View2.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/29/21.
//

import SwiftUI

struct View2: View {
    @Binding var showKitchen: Bool

    var body: some View {
        ZStack {
            VStack {
                Text("View 2")
                Button(action: {
                    withAnimation {
                        self.showKitchen.toggle()
                    }
                }, label: {
                    Text("Back")
                        .foregroundColor(.black)
                })
            }
            .frame(maxWidth: 800)
            .background(Color.gray)
            .transition(.move(edge: .trailing))
        }
    }
}

