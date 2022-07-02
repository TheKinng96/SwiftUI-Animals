//
//  Heading.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/02.
//

import SwiftUI

struct Heading: View {
  let headingImage: String
  let headingText: String
  
  var body: some View {
    HStack {
      Image(systemName: headingImage)
        .foregroundColor(.accentColor)
        .imageScale(.large)
      
      Text(headingText)
        .font(.title3)
        .fontWeight(.bold)
    } //: HSTACK
    .padding(.vertical)
  }
}

struct Heading_Previews: PreviewProvider {
  static var previews: some View {
    Heading(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
