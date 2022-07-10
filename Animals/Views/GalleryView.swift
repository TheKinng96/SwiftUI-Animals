//
//  GalleryView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import SwiftUI

struct GalleryView: View {
  @State private var selectedAnimal: String = "lion"
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  let animals: [AnimalModel] = Bundle.main.decode("animals.json")
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  func onGridChanged() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }
  
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
        
        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding()
          .onChange(of: gridColumn) { value in
            withAnimation(.easeIn) {
              onGridChanged()
            }
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
                hapticImpact.impactOccurred()
              }
          } //: LOOP
        } //: VSTACK
      } //:GRID
      .onAppear {
        onGridChanged()
      }
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
