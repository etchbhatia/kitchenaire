//
//  Screen1.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/29/21.
//

import SwiftUI

struct Screen1View: View {
    @Binding var showKitchen: Bool
    @Binding var showInstr: Bool
    var myTypes: [Any] = [View1.self, View2.self]

    var body: some View {
        List {
            ForEach(0..<myTypes.count) { index in
                self.buildView(types: self.myTypes, index: index)
            }
        }
        Button(action: {
            withAnimation {
                self.showKitchen.toggle()
                self.showInstr.toggle()
            }
        }, label: {
            Text("Instruction View")
        })
    }
    
    func buildView(types: [Any], index: Int) -> AnyView {
        switch types[index].self {
            case is View1.Type: return AnyView( View1(showKitchen: $showKitchen) )
            case is View2.Type: return AnyView( View2(showKitchen: $showKitchen) )
            default: return AnyView(EmptyView())
        }
    }
}

