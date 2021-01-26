//
//  ContentView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/22/21.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State private var showRecipes: Bool = false
    @State private var showItems: Bool = false
    @State private var showInstructions: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
            ARViewContainer()
            ControlView(showRecipes: $showRecipes, showItems: $showItems, showInstructions: $showInstructions)
        })
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        /*
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        */
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
#endif
