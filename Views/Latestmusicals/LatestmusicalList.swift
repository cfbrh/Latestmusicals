//
//  LatestmusicalList.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/21.
//

import SwiftUI

struct LatestmusicalList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showPlansOnly = false
    @State private var showFavoriteOnly = false
    
    
    var filteredLatestmusicals: [Latestmusical] {
        modelData.latestmusicals.filter{ latestmusical in
            (!showPlansOnly || latestmusical.isFeatured)
        }
    }
    
    var filtered2Latestmusicals: [Latestmusical] {
        modelData.latestmusicals.filter{ latestmusical in
            (!showFavoriteOnly || latestmusical.isFavorite)
        }
    }
    var filteredCombinedLatestmusicals: [Latestmusical] {
        if showPlansOnly && showFavoriteOnly {
            return filteredLatestmusicals.filter { latestmusical in
                filtered2Latestmusicals.contains { $0.id == latestmusical.id }
            }
        } else if showPlansOnly {
            return filteredLatestmusicals
        } else if showFavoriteOnly {
            return filtered2Latestmusicals
        } else {
            return modelData.latestmusicals
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showPlansOnly) {
                    Text("To-Watch List")
                }
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorite List")
                }
                ForEach(filteredCombinedLatestmusicals) { latestmusical in
                    NavigationLink {
                        LatestmusicalDetail(latestmusical: latestmusical)
                    } label: {
                        LatestmusicalRow(latestmusical: latestmusical)
                    }
                }
            }
            .animation(.default, value: filteredCombinedLatestmusicals)
            .navigationTitle("Latest Musicals")
        } detail: {
            Text ("Select a musical")
        }
    }
}

#Preview {
    LatestmusicalList()
        .environmentObject(ModelData())
}
