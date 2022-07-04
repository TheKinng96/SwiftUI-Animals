//
//  MapView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import SwiftUI
import MapKit

struct MapView: View {
  @State private var region: MKCoordinateRegion = {
    var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
    return mapRegion
  }()
  
  let locations: [LocationModel] = Bundle.main.decode("locations.json")
  
  var body: some View {
    Map(coordinateRegion: $region, annotationItems: locations) { location in
      MapAnnotation(coordinate: location.location) {
        MapAnnotationView(location: location)
      }
    } //： MAP
    .overlay(
      HStack(alignment: .center, spacing: 12) {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width: 50, height: 50, alignment: .center)
        
        VStack(alignment: .leading, spacing: 4) {
          HStack {
            Text("Longitude:")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            
            Spacer()
            
            Text("\(region.center.longitude)")
              .font(.footnote)
              .foregroundColor(.white)
          }
          
          Divider()
          
          HStack {
            Text("Latitude:")
              .font(.footnote)
              .fontWeight(.bold)
              .foregroundColor(.accentColor)
            
            Spacer()
            
            Text("\(region.center.latitude)")
              .font(.footnote)
              .foregroundColor(.white)
          }
        }
      } //: HSTACK
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(
          Color.black
            .opacity(0.6)
        )
        .cornerRadius(12)
        .padding()
      , alignment: .top
    )
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
