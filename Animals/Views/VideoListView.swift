//
//  VideoListView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import SwiftUI

struct VideoListView: View {
  @State var videos: [VideoModel] = Bundle.main.decode("videos.json")
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  
  var body: some View {
    NavigationView {
      List(videos) { item in
        NavigationLink(destination: VideoPlayerView(title: item.name, videoName: item.id)) {
          VideoRowItemView(video: item)
            .padding(.vertical, 8)
        }
      } //:LIST
      .listStyle(InsetGroupedListStyle())
      .navigationTitle("Videos")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            // Shuffle when click
            videos.shuffle()
            hapticImpact.impactOccurred()
          } label: {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }
    } //:NAVIGATION
  }
}

struct VideoListView_Previews: PreviewProvider {
  static let videos: [VideoModel] = Bundle.main.decode("videos.json")
  static var previews: some View {
    VideoListView()
  }
}
