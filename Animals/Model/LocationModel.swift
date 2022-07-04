//
//  MapModel.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/04.
//

import Foundation
import MapKit

struct LocationModel: Codable, Identifiable {
  let id: String
  let name: String
  let image: String
  let latitude: Double
  let longitude: Double
  
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
