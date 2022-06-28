//
//  AnimalModel.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/28.
//

import Foundation

struct AnimalModel: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
}
