//
//  GridAnimalView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/10.
//

import SwiftUI

struct GridAnimalView: View {
  let animal: AnimalModel
  var body: some View {
    Image(animal.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}

struct GridAnimalView_Previews: PreviewProvider {
  static var animals: [AnimalModel] = Bundle.main.decode("animals.json")
  static var previews: some View {
    GridAnimalView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
