//
//  Instr.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/29/21.
//

import SwiftUI

struct Instr: View {
    @Binding var showInstr: Bool
    var num: Int
    var instructions: [Inst]
    var body: some View {
        
        ZStack {
            NavigationView {
                VStack {
                    // base case
                    if (num == instructions.count) {
                        Button(action: {
                            withAnimation {
                                self.showInstr.toggle()
                            }
                        }, label: {
                            Text("Done")
                                .foregroundColor(.white)
                        })
                    }
                    // recursive call
                    else if (num < instructions.count) {
//                        Text("Item View")
                        NavigationLink(destination: Instr(showInstr: $showInstr,
                                                            num: num+1, instructions: instructions)) {
                            Text("\(instructions[num].text)")
                                .foregroundColor(.red)
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
            }
            .frame(maxWidth: 800)
            .background(Color.gray)
            .transition(.move(edge: .trailing))
            .navigationBarHidden(self.showInstr)
        }
    }
    /*
    var body: some View {
        ZStack {
            VStack {
                if (num == instructions.count) {
                    Button(action: {
                        withAnimation {
                            self.showInstr.toggle()
                        }
                    }, label: {
                        Text("Done")
                            .foregroundColor(.white)
                    })
                }
                // recursive call
                else if (num < instructions.count) {
//                        Text("Item View")
                    NavigationLink(destination: Instr(showInstr: $showInstr,
                                                      num: num+1, instructions: instructions)) {
                        Text("\(instructions[num].text)")
                            .foregroundColor(.pink)
                    }
                    .navigationBarHidden(true)
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
            .background(Color.black)
            .transition(.move(edge: .trailing))
        }
    }
 */
}
