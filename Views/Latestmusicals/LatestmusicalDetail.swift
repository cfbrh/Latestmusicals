//
//  LatestmusicalDetail.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/21.
//

import SwiftUI

struct LatestmusicalDetail: View {
    @EnvironmentObject var modelData: ModelData
    var latestmusical: Latestmusical

    var latestmusicalIndex: Int {
        modelData.latestmusicals.firstIndex(where: { $0.id == latestmusical.id })!
    }

    
    var body: some View {
        
        ScrollView {
            MapView(coordinate: latestmusical.locationCoordinate)
                .frame(height: 300)


            CircleImage(image: latestmusical.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                HStack {
                    Text(latestmusical.name)
                        .font(.title)
                    PlanButton(isSet:
                        $modelData.latestmusicals[latestmusicalIndex].isFeatured)
                    FavoriteButton(isSet: $modelData.latestmusicals[latestmusicalIndex].isFavorite)
                }


                HStack {
                    Text(latestmusical.theatre)
                    Spacer()
                    Text(latestmusical.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()


                Text("About \(latestmusical.name)")
                    .font(.title2)
                Text(latestmusical.description)
            }
            .padding()
        }
        .navigationTitle(latestmusical.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LatestmusicalDetail(latestmusical: modelData.latestmusicals[0])
        .environmentObject(ModelData())
}
