//
//  GalleryView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/02.
//

import SwiftUI

struct InsertGalleryView: View {
  let animal: AnimalModel

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 15) {
        ForEach(animal.gallery, id: \.self) { item in
          Image(item)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .cornerRadius(12)
        }
      } //:HSTACK
    } //:SCROLL
  }
}

struct InsertGalleryView_Previews: PreviewProvider {
  static var animals: [AnimalModel] = Bundle.main.decode("animals.json")
  static var previews: some View {
    InsertGalleryView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
