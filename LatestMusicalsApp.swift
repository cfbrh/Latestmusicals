//
//  LatestMusicalsApp.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/20.
//

import SwiftUI

@main
struct LatestMusicalsApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
