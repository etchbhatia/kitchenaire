//
//  Items.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/25/21.
//

import Foundation
import SwiftUI


struct Items: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var category: Int
    var recipe: Int
}
    
extension Items {
    var image: Image {
        RecipeImageStore.shared.image(name: imageName)
    }
}


extension Items {
    var locate: String {
        get {
            switch category {
            case 0:
                return "Fridge" // change it with action
            case 1:
                return "Cooktop"
            case 2:
                return "Condiments"
            default:
                return "Null"
            }
        }
    }
}
    


/*
struct ItemButton: View {
  let model: Model
  let action: () -> Void

  var body: some View {
    Button(action: {
      self.action()
      })

  }

*/

/*
enum ModelCategory: CaseIterable {
    case fridge // 0
    case cooktop // 1
    case condiments // 2
    
    var label: String {
        get {
            switch self {
            case .fridge:
                return "Point to Fridge" // change it with action
            case .cooktop:
                return "Point to Cooktop"
            case .condiments:
                return "Point to Condiments"
            default:
                return "Where do you find that?"
            }
        }
    }
}

class Model {
    var name: String
    var category: ModelCategory
    var thumbnail: UIImage
    var modelEntity: ModelEntity?
    
    init(name: String, category: ModelCategory, image: UIImage) {
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
    }
    //TODO: Create a method to async load ModelEntity when needed
}

struct Models {
    var all: [Model] = []
    
    init() {
        // Fridge
        let milk = Model(name: "milk", category: .fridge)
        let bread = Model(name: "bread", category: .fridge)
        let cheese = Model(name: "cheese", category: .fridge)
        
        self.all += [milk, bread, cheese]
        
        // Cooktop
        let pan = Model(name: "pan", category: .cooktop)
        let boil = Model(name: "boil", category: .cooktop)
        let warm = Model(name: "warm", category: .cooktop)
        
        self.all += [pan, boil, warm]
        
        // Condiments
        let salt = Model(name: "salt", category: .condiments)
        let sugar = Model(name: "sugar", category: .condiments)
        let oregano = Model(name: "oregano", category: .condiments)
        
        self.all += [salt, sugar, oregano]
    }
    
//    func getCategory(Model: m) -> ModelCategory() {
//        return m.category
//    }
}
//TODO:

*/
