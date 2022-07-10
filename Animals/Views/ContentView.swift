//
//  ContentView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import SwiftUI

struct ContentView: View {
  @State private var isGridViewActive: Bool = false
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Int = 1
  @State private var toolbarIcon: String = "square.grid.2x2"
  let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  
  func updateGridLayout() {
    gridLayout = Array(repeating: .init(.flexible()), count: gridColumn % 3 + 1)
    gridColumn = gridLayout.count
    
    switch gridColumn {
    case 1:
      toolbarIcon = "square.grid.2x2"
    case 2:
      toolbarIcon = "square.grid.3x2"
    case 3:
      toolbarIcon = "rectangle.grid.1x2"
    default:
      toolbarIcon = "square.grid.2x2"
    }
  }

  var body: some View {
    NavigationView {
      Group {
        if !isGridViewActive {
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
            
            CreditView()
              .modifier(CenterModifier())
              .listRowBackground(Color.clear)
          } //: LIST
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  GridAnimalView(animal: animal)
                } //: LINK
              } //: LOOP
            } //: GRID
            .padding(10)
            .animation(.easeIn, value: isGridViewActive)
          } //: SCROLL
        } //: CONDITIONAL
      } //:  GROUP
      .navigationBarTitle("Africa", displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 10) {
            // LIST VIEW
            Button {
              isGridViewActive = false
              haptics.impactOccurred()
            } label: {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            } // BUTTON
            
            // GRID VIEW
            Button {
              isGridViewActive = true
              haptics.impactOccurred()
              updateGridLayout()
            } label: {
              Image(systemName: toolbarIcon)
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
