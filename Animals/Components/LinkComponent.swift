//
//  LinkComponent.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/03.
//

import SwiftUI

struct LinkComponent: View {
  let animal: AnimalModel
  
  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("Wikipedia")
        
        Spacer()
        
        Group {
          Image(systemName: "arrow.up.right.square")
          
          Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
        } //: GROUP
        .foregroundColor(.accentColor)
      } //:HSTACK
    } //: BOX
  }
}

struct LinkComponent_Previews: PreviewProvider {
  static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    LinkComponent(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
