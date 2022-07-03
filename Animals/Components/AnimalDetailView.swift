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
          
          InsertGalleryView(animal: animal)
        }
        .padding(.horizontal)
        
        // Facts
        Group {
          Heading(headingImage: "questionmark.circle", headingText: "Did you know?")
          
          InsertFactBlock(animal: animal)
        }
        .padding(.horizontal)
        
        // Description
        Group {
          Heading(headingImage: "info.circle", headingText: "All about \(animal.name)")
          
          Text(animal.description)
            .multilineTextAlignment(.leading)
            .layoutPriority(1)
        }
        .padding(.horizontal)
        
        // Map
        Group {
          Heading(headingImage: "map", headingText: "National Parks")
          
          InsertMap()
        }
        .padding(.horizontal)

        // Link
        LinkComponent(animal: animal)
        
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
