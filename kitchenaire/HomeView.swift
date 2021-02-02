//
//  HomeView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/28/21.
//

import SwiftUI

struct HomeView: View {
    @Binding var showRecipe: Bool

    var body: some View {

        VStack {
            Text("Home View")
            Button(action: {
                withAnimation {
                    self.showRecipe.toggle()
                }
            }, label: {
                Text("Settings")
            })
        }
        .frame(maxWidth: 800)
        .background(Color.green)
    }
}
