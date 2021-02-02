//
//  InstrView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/29/21.
//

import SwiftUI

struct InstrView: View {
    @Binding var showInstr: Bool
    
    let i1: Inst = Inst(id: 1, text: "Put it here", category: 0, imageName: "here")
    let i2: Inst = Inst(id: 2, text: "Not here, over there", category: 1, imageName: "there")
    
    var body: some View {
        let instructions: [Inst] = getInstr()
        let num: Int = 0
        
        Instr(showInstr: $showInstr, num: num, instructions: instructions)
        
    }
    /*
    var body: some View {
        let instructions: [Inst] = getInstr()
        let num: Int = 0
        
        ZStack {
            VStack {
                if (num < instructions.count) {
                    NavigationView {
                        VStack {
                            Text(instructions[num-1].text)
                            NavigationLink(destination: Instr(showInstr: $showInstr, num: num+1, instructions: instructions)) {
                                Text("Go to step \(num)")
                                    .foregroundColor(.orange)
                            }
                            .navigationBarHidden(true)
                        }
                    }
                }
                Button(action: {
                    withAnimation {
                        self.showInstr.toggle()
                    }
                }, label: {
                    Text("Home")
                        .foregroundColor(.white)
                })
            }
            .frame(maxWidth: 800)
            .background(Color.pink)
            .transition(.move(edge: .trailing))
        }
    }
    */
    func getInstr() -> [Inst] {
        var contacts: [Inst] = []
        contacts.append(i1)
        contacts.append(i2)
        return contacts
    }
    
}

struct Inst: Decodable, Hashable, Identifiable {
    var id: Int
    var text: String
    var category: Int
    var imageName: String
}

