//
//  ProfileHost.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/21.
//

import SwiftUI


struct ProfileHost: View {
    @State private var draftProfile = Profile.default


    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
        .environmentObject(ModelData())
    }
}


#Preview {
    ProfileHost()
        .environmentObject(ModelData())
}
