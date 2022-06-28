//
//  CodableExtension.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    // 1. Locate JSON file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle.")
    }
    
    // 2. Create a property of the data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) in bundle.")
    }
    
    // 3. Create a decoder
    let decoder = JSONDecoder()
    
    // 4. Create a property of the decoded data
    guard let loaded = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) in bundle.")
    }
    
    // 5. Return data
    return loaded
  }
}
