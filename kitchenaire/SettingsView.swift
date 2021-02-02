//
//  SettingsView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/28/21.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showRecipe: Bool
    @Binding var showKitchen: Bool
    @Binding var showInstr: Bool

    var body: some View {
        VStack {
            Text("Settings View")
            Button(action: {
                withAnimation {
                    self.showRecipe.toggle()
                }
            }, label: {
                Text("Back")
            })
            Button(action: {
                withAnimation {
                    self.showKitchen.toggle()
                    self.showRecipe.toggle()
                }
            }, label: {
                Text("Find Items")
            })
//            if self.showKitchen {
//                FindItemView(showKitchen: $showKitchen, showInstr: $showInstr)
//            }
        }
        .frame(maxWidth: 800)
        .background(Color.red)
        .transition(.move(edge: .trailing))
    }
}

