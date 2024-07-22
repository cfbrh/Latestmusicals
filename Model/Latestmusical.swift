//
//  Latestmusical.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Latestmusical: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var city: String
    var state: String
    var isFeature: Bool
    var isFeatured: Bool
    var isFavorite: Bool
    var theatre: String
    var description: String
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case latest = "2024"
        case previous = "Previous"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    var featureImage: Image? {
        isFeature ? Image(imageName + "_feature") : nil
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

}
