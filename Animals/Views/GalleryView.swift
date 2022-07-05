//
//  GalleryView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import SwiftUI

struct GalleryView: View {
  var body: some View {
    ScrollView {
      Text("Gallery View")
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
