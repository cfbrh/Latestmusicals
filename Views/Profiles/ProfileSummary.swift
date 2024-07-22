//
//  ProfileSummary.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/21.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Email: ") + Text(profile.email)
                Text("University: ") + Text(profile.uni)
                Text("Major: ") + Text(profile.major)
                Text("Graduate Date: ") + Text(profile.graduateDate)
                Text("Mood: \(profile.mood.rawValue)")
                
            }
            .padding()
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environmentObject(ModelData())
}
