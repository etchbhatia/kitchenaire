//
//  CustomBox.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 2/1/21.
//

import SwiftUI
import RealityKit
import Combine

class CustomBox: Entity, HasModel {
    
    var baseColor : UIColor!
    /// Used to keeping a reference of any subscriptions involving this entity
    var entitySubs: [Cancellable] = []
    
    
    required init(color: UIColor) {
        super.init()
        
        baseColor = color
        
        /// Model of this entity, the physical appearance is a 0.1x0.1x0.1 cuboid
        self.components[ModelComponent] = ModelComponent(
            mesh: .generateBox(size: [0.1, 0.1, 0.1]),
            materials: [SimpleMaterial(
                color: color,
                isMetallic: false)
            ]
        )
    }
    
    required convenience init() {
        self.init(color: .orange)
    }
    
    func color() -> UIColor {
        return baseColor
    }
}


extension CustomBox {}
