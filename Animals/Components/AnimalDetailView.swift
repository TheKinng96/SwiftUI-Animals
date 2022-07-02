//
//  AnimalDetailView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/02.
//

import SwiftUI

struct AnimalDetailView: View {
  let animal: AnimalModel

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 20) {
        // Hero image
        Image(animal.image)
          .resizable()
          .scaledToFit()
        
        // Title
        Text(animal.name.uppercased())
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .foregroundColor(.primary)
          .background(
            Color.accentColor
              .frame(height: 6)
              .offset(y: 24)
          )
        
        // Headline
        Text(animal.headline)
          .font(.headline)
          .foregroundColor(.accentColor)
          .multilineTextAlignment(.leading)
          .padding(.horizontal)
        
        // Gallery
        Group {
          Heading(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
        }
        .padding(.horizontal)
        // Facts
        // Description
        // Map
        // Link
        
      }//: VSTACK
      .navigationTitle("Learn about \(animal.name)")
      .navigationBarTitleDisplayMode(.inline)
    }//: SCROLL
  }
}

struct AnimalDetailView_Previews: PreviewProvider {
  static var animals: [AnimalModel] = Bundle.main.decode("animals.json")
  static var previews: some View {
    AnimalDetailView(animal: animals[0])
  }
}
