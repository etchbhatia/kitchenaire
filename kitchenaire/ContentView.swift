//
//  ContentView.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/22/21.
//

import SwiftUI
import RealityKit
import ARKit
import ResightSDK
import Combine

struct ContentView : View {
//    @State private var showRecipes: Bool = false
//    @State private var showItems: Bool = false
//    @State private var showInstructions: Bool = false


    @State private var showRecipe: Bool = false
    @State private var showKitchen: Bool = false
    @State private var showInstr: Bool = false

    var body: some View {
        ZStack {
            VStack {
                ResightViewContainer()
                if self.showInstr {
//                    VStack {
//                        ARViewContainer()
                        InstrView(showInstr: $showInstr)
//                    }
                } else if self.showKitchen {
//                    VStack {
//                        ResightViewContainer()
                        FindItemView(showKitchen: $showKitchen, showInstr: $showInstr)
//                    }
                } else if self.showRecipe {
//                    VStack {
//                        ARViewContainer()
                        SettingsView(showRecipe: $showRecipe, showKitchen: $showKitchen, showInstr: $showInstr)
//                    }
                } else {
//                    VStack {
//                        ARViewContainer()
                        HomeView(showRecipe: $showRecipe)
//                    }
                }
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}


struct ResightViewContainer: UIViewRepresentable, ResightEntityDelegate {
    static var cancellable : AnyCancellable!
    
    func entity(encode entity: Entity) -> Data {
        return try! NSKeyedArchiver.archivedData(withRootObject: (entity as! CustomBox).color(), requiringSecureCoding: false)
    }
    
    func entity(decode data: Data) -> Entity {
        let color = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! UIColor
        return CustomBox(color: color)
    }
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        LibResight.instance.onState += { (status) in
            switch status {
            case EngineState.initializing:
                let rsAnchor = LibResight.ResightAnchor(world: matrix_identity_float4x4)
                arView.scene.addAnchor(rsAnchor)
                
                ResightViewContainer.cancellable = LibResight.RealityKitPlugin.instance.onTapGesture.sink() { (gesture) in
                    let point = gesture.location(in: gesture.view)
                    
                    let ray = arView.ray(through: point)
                    
                    let transform = Transform(scale: [0.2, 0.2, 0.2], rotation: simd_quaternion(matrix_identity_float4x4), translation: ray!.origin + ray!.direction * 0.2)
                    
                    let r = CGFloat(Float.random(in: 0 ..< 1))
                    let g = CGFloat(Float.random(in: 0 ..< 1))
                    let b = CGFloat(Float.random(in: 0 ..< 1))
                    
                    let steelBox = CustomBox(color: UIColor(red: r, green:g, blue: b, alpha: 1.0))
                    steelBox.setTransformMatrix(transform.matrix, relativeTo: nil)
                    
                    rsAnchor.addChild(steelBox, preservingWorldTransform: true)
                }
            default:
                break
            }
        }
        
        LibResight.RealityKitPlugin.instance.delegate = self
        LibResight.RealityKitPlugin.instance.initialize("ZXRjaGJoYXRpYUBnbWFpbC5jb20sbHc0MlBUaGJLWA==", namespace: "kithcenaire", view: arView)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
