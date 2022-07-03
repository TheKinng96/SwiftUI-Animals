//
//  InsertFactBlock.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/03.
//

import SwiftUI

struct InsertFactBlock: View {
  let animal: AnimalModel

  var body: some View {
    GroupBox {
      TabView {
        ForEach(animal.fact, id: \.self) { fact in
          Text(fact)
            .multilineTextAlignment(.center)
        }
      } //: TAB
      .tabViewStyle(PageTabViewStyle())
      .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
    } //:BOX
  }
}

struct InsertFactBlock_Previews: PreviewProvider {
  static var animals: [AnimalModel] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    InsertFactBlock(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
