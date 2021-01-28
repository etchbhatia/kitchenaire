//
//  Recipe.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/25/21.
//

import Foundation
import SwiftUI

// MARK: - Recipe
/*
struct Recipe: Decodable, Hashable, Identifiable {
    var id: Int
    var name, imageName: String
    var itemsCount, instructionsCount: Int
    var items: [Item]
    var instructions: [Instruction]
}
*/

struct Recipe: Decodable, Hashable, Identifiable {
    var id: Int
    var name, imageName: String
    var items: [Item]?
    var instructions: [Instruction]?


    // MARK: - Item
    struct Item: Decodable, Hashable {
        var name: String
        var category: Int
        var imageName: String
        var registered: Bool
    }


    // MARK: - Instruction
    struct Instruction: Decodable, Hashable {
        var text: String
        var category: Int
        var imageName: String
    }
}

extension Recipe {
    var image: Image {
        RecipeImageStore.shared.image(name: imageName)
    }
}



extension Recipe.Item {
    var image: Image {
        RecipeImageStore.shared.image(name: imageName)
    }
}


extension Recipe.Item {
    var locate: String {
        get {
            switch category {
            case 0:
                return "Fridge" // replace this with action
            case 1:
                return "Cooktop"
            case 2:
                return "Condiments"
            default:
                return ""
            }
        }
    }
}

/*
struct ItemArray: Decodable {
    var array: [Item]
}

struct InstructionArray: Decodable {
    var array: [Instruction]
}
 */
