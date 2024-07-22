//
//  CategoryItem.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/21.
//

import SwiftUI

struct CategoryItem: View {
    var latestmusical: Latestmusical
    
    var body: some View {
        VStack(alignment: .leading) {
            latestmusical.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(latestmusical.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(latestmusical: ModelData().latestmusicals[0])
}
