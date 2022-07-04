//
//  MapAnnotationView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/04.
//

import SwiftUI

struct MapAnnotationView: View {
  @State private var isAnimating: Double = 0.0
  let location: LocationModel
  var body: some View {
    ZStack {
      Circle()
        .fill(Color.accentColor)
        .frame(width: 54, height: 54, alignment: .center)
      
      Circle()
        .stroke(Color.accentColor, lineWidth: 2)
        .frame(width: 52, height: 52, alignment: .center)
        .scaleEffect(1 + isAnimating)
        .opacity(1 - isAnimating)
      
      Image(location.image)
        .resizable()
        .scaledToFit()
        .frame(width:48, height: 48, alignment: .center)
        .clipShape(Circle())
    } //: ZSTACK
    .onAppear {
      withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
        isAnimating = 1
      }
    }
  }
}

struct MapAnnotationView_Previews: PreviewProvider {
  static var locations: [LocationModel] = Bundle.main.decode("locations.json")
  static var previews: some View {
    MapAnnotationView(location: locations[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
