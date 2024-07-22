//
//  FeatureCard.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/22.
//

import SwiftUI

struct FeatureCard: View {
    var latestmusical: Latestmusical


    var body: some View {
        latestmusical.featureImage?
            .resizable()
            .overlay {
                TextOverlay(latestmusical: latestmusical)
            }
    }
}

struct TextOverlay: View {
    var latestmusical: Latestmusical


    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }


    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(latestmusical.name)
                    .font(.title)
                    .bold()
                Text(latestmusical.theatre)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}



#Preview {
    FeatureCard(latestmusical: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
