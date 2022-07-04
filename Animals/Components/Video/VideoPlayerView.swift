//
//  VideoPlayerView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/03.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  var title: String
  var videoName: String
  var body: some View {
    VStack {
      VideoPlayer(player: playVideo(fileName: videoName, fileFormat: "mp4"))
        .overlay(
          Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .padding()
          , alignment: .topLeading
        )
    } //: VSTACK
    .foregroundColor(.accentColor)
    .navigationTitle(title)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      VideoPlayerView(title: "Cheetah", videoName: "cheetah")
    }
  }
}
