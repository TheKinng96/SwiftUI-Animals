//
//  ContentView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import SwiftUI

struct ContentView: View {
  @State private var isGridViewActive: Bool = false
  let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)

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
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 10) {
            // LIST VIEW
            Button {
              print("clicked!")
              isGridViewActive = false
              haptics.impactOccurred()
            } label: {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            } // BUTTON
            
            // GRID VIEW
            Button {
              print("clicked!")
              isGridViewActive = true
              haptics.impactOccurred()
            } label: {
              Image(systemName: "square.grid.2x2")
                .font(.title2)
                .foregroundColor(!isGridViewActive ? .primary : .accentColor)
            } // BUTTON
          } //:HSTACK
        } //: TOOLBAR_ITEM
      } //: TOOLBAR
    } //: NAVIGATION
  }
}

struct ContentView_Previews: PreviewProvider {
  static var animals: [AnimalModel] = Bundle.main.decode("animals.json")
  static var previews: some View {
    ContentView()
  }
}
