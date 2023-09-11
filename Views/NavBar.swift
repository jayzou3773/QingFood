//
//  navBar.swift
//  QingFood
//
//
//  Created by 吴卓航 on 2023/5/26.
//

import SwiftUI

struct NavBar: View {
    @State private var selection = 1
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    var body: some View {
        TabView(selection: $selection) {
            HomeView().tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
            }.tag(1)
            
            CheckOut().tabItem {
                VStack {
                    Image(systemName: "heart.fill")
                    Text("Favorite")
                }
                
            }.tag(2)
            
            ImagePickView().tabItem {
                VStack {
                    Image(systemName: "camera.fill")
                    Text("Detect")
                }
                
            }.tag(3)
        }
        .accentColor(.green)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
