//
//  Recipe.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/25/21.
//

import Foundation
import SwiftUI

struct Recipe: Decodable, Hashable, Identifiable {
  var id: Int
  var name: String
  var imageName: String
}

extension Recipe {
    var image: Image {
        KitchenImageStore.shared.image(name: imageName)
    }
}
