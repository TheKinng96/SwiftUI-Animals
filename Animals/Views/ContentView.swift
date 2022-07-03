//
//  ContentView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import SwiftUI

struct ContentView: View {
  var animals: [AnimalModel] = Bundle.main.decode("animals.json")

  var body: some View {
    NavigationView {
      List {
        CoverImage()
          .frame(height: 300)
          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        
        ForEach(animals) { animal in
          NavigationLink(destination: AnimalDetailView(animal: animal)) {
            AnimalListItemRow(animal: animal)
          }
        }
        .listRowBackground(Color.clear)
      } //: LIST
      .navigationBarTitle("Africa", displayMode: .large)
    } //: NAVIGATION
  }
}

struct ContentView_Previews: PreviewProvider {
  static var animals: [AnimalModel] = Bundle.main.decode("animals.json")
  static var previews: some View {
    ContentView(animals: animals)
  }
}
