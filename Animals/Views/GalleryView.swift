//
//  GalleryView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import SwiftUI

struct GalleryView: View {
  @State private var selectedAnimal: String = "lion"
  let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 30) {
        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay {
            Circle().stroke(.white, lineWidth: 4)
          }
        
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(animals) { animal in
            Image(animal.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay {
                Circle().stroke(.white, lineWidth: 1)
              }
              .onTapGesture {
                selectedAnimal = animal.image
              }
          } //: LOOP
        } //: VSTACK
      } //:GRID
    } //: SCROLL
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    .background(GalleryBackgroundView())
  }
}

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
