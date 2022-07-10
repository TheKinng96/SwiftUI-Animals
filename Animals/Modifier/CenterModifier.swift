//
//  CenterModifier.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/10.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
