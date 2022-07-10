//
//  CreditView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/10.
//

import SwiftUI

struct CreditView: View {
  var body: some View {
    VStack {
      Image("compass")
        .resizable()
        .scaledToFit()
        .frame(height: 128)
      
      Text("""
  Copyright © TheKinng96
  All Right Reserved
  Making a Bridge to Ideas
  """)
      .multilineTextAlignment(.center)
    .font(.footnote)
    } //: VSTACK
    .padding()
    .opacity(0.4)
  }
}

struct CreditView_Previews: PreviewProvider {
  static var previews: some View {
    CreditView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
