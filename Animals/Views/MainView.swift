//
//  MainView.swift
//  Animals
//
//  Created by Feng Yuan Yap on 2022/06/26.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      ContentView()
        .tabItem {
          Image(systemName: "square.grid.2x2")
          Text("Browse")
        }
      
      VideoListView()
        .tabItem {
          Image(systemName: "play.square")
          Text("Video")
        }
      
      MapView()
        .tabItem {
          Image(systemName: "map")
          Text("Location")
        }
      
      GalleryView()
        .tabItem {
          Image(systemName: "photo")
          Text("Gallery")
        }
    } //: TAB
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
