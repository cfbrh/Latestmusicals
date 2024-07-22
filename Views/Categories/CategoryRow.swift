//
//  CategoryRow.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/21.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Latestmusical]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { latestmusical in
                        NavigationLink{
                            LatestmusicalDetail(latestmusical: latestmusical)
                        } label: {
                            CategoryItem(latestmusical: latestmusical)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let latestmusicals = ModelData().latestmusicals
    return CategoryRow(
        categoryName: latestmusicals[0].category.rawValue, items: Array(latestmusicals.prefix(4))
    )
}
