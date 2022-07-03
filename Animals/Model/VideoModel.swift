//
//  VideoModel.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/03.
//

import Foundation

struct VideoModel: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  var thumbnail: String {
    "video-\(id)"
  }
}
