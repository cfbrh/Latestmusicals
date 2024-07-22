//
//  Profile.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/21.
//

import Foundation

struct Profile {
    var username: String
    var email: String
    var uni: String
    var major: String
    var graduateDate: String
    var mood = Mood.happy
    

    static let `default` = Profile(username: "Wenjia Zhang", email: "wz2647@columbia.edu", uni:"Columbia Univeristy", major: "Computer Science", graduateDate: "May 15, 2024")
    
    enum Mood: String, CaseIterable, Identifiable {
        case happy = "😄"
        case sad = "😭"
        case soso = "😌"

        var id: String { rawValue }
    }
}
