//
//  ContentView.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/20.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Musicals", systemImage: "star")
                }
                .tag(Tab.featured)

            LatestmusicalList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        .environmentObject(ModelData())
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
