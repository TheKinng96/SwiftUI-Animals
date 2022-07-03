//
//  VideoRowItemView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/07/03.
//

import SwiftUI

struct VideoRowItemView: View {
  let video: VideoModel
  
  var body: some View {
    HStack(spacing: 10) {
      ZStack {
        Image(video.thumbnail)
          .resizable()
          .scaledToFit()
          .frame(height: 80)
          .cornerRadius(12)
        
        Image(systemName: "play.circle")
          .resizable()
          .scaledToFit()
          .frame(height:32)
          .shadow(radius: 4)
      } //: ZSTACK
      
      VStack(alignment: .leading, spacing: 10) {
        Text(video.name)
          .font(.title2)
          .foregroundColor(.accentColor)
        .fontWeight(.heavy)
  
        Text(video.headline)
          .font(.footnote)
          .multilineTextAlignment(.leading)
      }
    } //: HSTACK
  }
}

struct VideoRowItemView_Previews: PreviewProvider {
  static var videos: [VideoModel] = Bundle.main.decode("videos.json")
  
  static var previews: some View {
    VideoRowItemView(video: videos[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
