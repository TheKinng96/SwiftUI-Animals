//
//  MapExtension.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/04.
//

import Foundation
import MapKit
import UIKit

extension Map {
  func mapStyle(_ mapType: MKMapType, showScale: Bool = true, showTraffic: Bool = false) -> some View {
    let map = MKMapView.appearance()
    map.mapType = mapType
    map.showsScale = showScale
    map.showsTraffic = showTraffic
    return self
  }
  
  func addAnnotations(_ annotations: [MKAnnotation]) -> some View {
    MKMapView.appearance().addAnnotations(annotations)
    return self
  }
  
  func addOverlay(_ overlay: MKOverlay) -> some View {
    MKMapView.appearance().addOverlay(overlay)
    return self
  }
}
