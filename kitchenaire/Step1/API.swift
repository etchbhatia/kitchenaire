//
//  API.swift
//  kitchenaire
//
//  Created by Harpreet Bhatia on 1/25/21.
//

import SwiftUI
import Foundation

let recipeItems: [Recipe] = processJSONData(filename: "recipeData.json")

private func processJSONData<T: Decodable>(filename: String) -> T {
  let data: Data
  guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
      else {
          fatalError("Couldn't find \(filename) in main bundle.")
  }
  
  do {
      data = try Data(contentsOf: file)
  } catch {
      fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
  }
  
  do {
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
  } catch {
      fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
  }
}

final class KitchenImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = KitchenImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(KitchenImageStore.scale), label: Text(verbatim: name))
    }

    static func loadPNGImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "png"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).png from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = KitchenImageStore.loadPNGImage(name: name)
        return images.index(forKey: name)!
    }
}
