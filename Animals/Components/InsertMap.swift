//
//  InsertMap.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/03.
//

import SwiftUI
import MapKit

struct InsertMap: View {
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
  
  var body: some View {
    Map(coordinateRegion: $region)
      .overlay(
        NavigationLink(destination: MapView()) {
          HStack {
            Image(systemName: "mappin.circle")
              .foregroundColor(.white)
              .imageScale(.large)
            
            Text("Locations")
              .foregroundColor(.accentColor)
              .fontWeight(.bold)
          } //: HSTACK
          .padding(.vertical, 10)
          .padding(.horizontal, 14)
          .background(
            Color.black
              .opacity(0.4)
              .cornerRadius(8)
          )
          .cornerRadius(8)
        } //: NAVIGATION
          .padding()
        , alignment: .topTrailing
      )
      .frame(height: 256)
      .cornerRadius(12)
  }
}

struct InsertMap_Previews: PreviewProvider {
  static var previews: some View {
    InsertMap()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
