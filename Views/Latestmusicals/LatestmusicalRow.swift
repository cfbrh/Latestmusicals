//
//  LatestmusicalRow.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/21.
//

import SwiftUI

struct LatestmusicalRow: View {
    var latestmusical: Latestmusical
    
    var body: some View {
        HStack {
            latestmusical.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(latestmusical.name)
            Spacer()
            
            if latestmusical.isFeatured{
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
                
            if latestmusical.isFavorite{
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    let latestmusical = ModelData().latestmusicals
    return Group {
        LatestmusicalRow(latestmusical: latestmusicals[0])
        LatestmusicalRow(latestmusical: latestmusicals[1])
    }
}
