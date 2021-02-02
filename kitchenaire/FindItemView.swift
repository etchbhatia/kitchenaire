//
//  FindItemView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/29/21.
//

import SwiftUI

struct FindItemView: View {
    @Binding var showKitchen: Bool
    @Binding var showInstr: Bool
    let i1 = FindItem(id: 1, name: "Bread", category: 0, imageName: "bread", registered: false)
    let i2 = FindItem(id: 2, name: "Pan", category: 1, imageName: "pan", registered: false)


    var body: some View {
        let items: [FindItem] = getItem()
        let num: Int = 0
//        let count = items.count
        
        IteView(showKitchen: $showKitchen, showInstr: $showInstr, num: num, items: items)
    }
        /*
        
        // recursive call
        ZStack {
            VStack {
                // base case
//                if (num < count) {
                NavigationView {
                    VStack {
                        if (num == count) {
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
                        if (num < count) {
                            Text("Item View")
                            NavigationLink(destination: FindItemView(showKitchen: $showKitchen, showInstr: $showInstr)
                                            IteView(showKitchen: $showKitchen, num: num+1, items: items)) {
                                Text("Find item \(num)")
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
//                }
//                Button(action: {
//                    withAnimation {
//                        self.showKitchen.toggle()
//                    }
//                }, label: {
//                    Text("Home")
//                        .foregroundColor(.white)
//                })
            }
            .frame(maxWidth: 800)
            .background(Color.blue)
            .transition(.move(edge: .trailing))
        }
 
    }
    */
    func getItem() -> [FindItem] {
        var contacts: [FindItem] = []
        contacts.append(i1)
        contacts.append(i2)
        return contacts
    }
    
}

struct FindItem: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String
    var category: Int
    var imageName: String
    var registered: Bool
}
