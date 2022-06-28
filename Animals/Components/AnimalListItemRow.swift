//
//  AnimalListItemRow.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/28.
//

import SwiftUI

struct AnimalListItemRow: View {
  var animal: AnimalModel
  
  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      Image(animal.image)
        .resizable()
        .scaledToFill()
        .frame(width: 90, height: 90)
        .clipShape(
          RoundedRectangle(cornerRadius: 12)
        )
      
      VStack(alignment: .leading, spacing: 8) {
        Text(animal.name)
          .foregroundColor(.accentColor)
          .font(.title2)
          .fontWeight(.heavy)
        
        Text(animal.headline)
          .lineLimit(2)
          .font(.footnote)
          .multilineTextAlignment(.leading)
          .padding(.trailing, 8)
      } //: VSTACK
    } //:HSTACK
  }
}

struct AnimalListItemRow_Previews: PreviewProvider {
  static var animals: [AnimalModel] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    AnimalListItemRow(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
