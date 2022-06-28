//
//  CoverImage.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import SwiftUI

struct CoverImage: View {
  var coverImages: [CoverImageModel] = Bundle.main.decode("covers.json")
  
  var body: some View {
    TabView {
      ForEach(coverImages) { item in
        Image(item.name)
          .resizable()
          .scaledToFill()
      }
    }
    .tabViewStyle(PageTabViewStyle())
  }
}

struct CoverImage_Previews: PreviewProvider {
  static var previews: some View {
    CoverImage()
      .previewLayout(.fixed(width: 400, height: 300))
  }
}
