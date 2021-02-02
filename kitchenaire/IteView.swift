//
//  IteView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/29/21.
//

import SwiftUI



struct IteView: View {
    @Binding var showKitchen: Bool
    @Binding var showInstr: Bool
    var num: Int
    var items: [FindItem]
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                VStack {
//                    ARViewContainer()
                    // base case
                    if (num == items.count) {
                        Button(action: {
                            withAnimation {
                                self.showKitchen.toggle()
                                self.showInstr.toggle()
                            }
                        }, label: {
                            Text("Instruction View")
                                .foregroundColor(.white)
                        })
                    }
                    // recursive call
                    else if (num < items.count) {
//                        Text("Item View")
                        NavigationLink(destination: IteView(showKitchen: $showKitchen,
                                                            showInstr: $showInstr, num: num+1, items: items)) {
                            Text("Look for \(items[num].name)")
                                .foregroundColor(.yellow)
                        }
                        
                    }
                    Button(action: {
                        withAnimation {
                            self.showKitchen.toggle()
                        }
                    }, label: {
                        Text("Home")
                            .foregroundColor(.white)
                    })
                }
            }
            .frame(maxWidth: 800)
            .background(Color.gray)
            .transition(.move(edge: .trailing))
            .navigationBarHidden(self.showKitchen)
        }
    }
}
    /*
    var body: some View {
        ZStack {
            VStack {
                if (num < items.count) {
                    NavigationView {
                        VStack {
                            Text(items[num-1].name)
                            NavigationLink(destination: IteView(showKitchen: $showKitchen, num: num+1, items: items)) {
                                Text("Go to step \(num)")
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                }
                Text("Item \(num)")
                Button(action: {
                    withAnimation {
                        self.showKitchen.toggle()
                    }
                }, label: {
                    Text("Home")
                        .foregroundColor(.white)
                })
            }
            .frame(maxWidth: 800)
            .background(Color.black)
            .transition(.move(edge: .trailing))
        }
    }
 */


