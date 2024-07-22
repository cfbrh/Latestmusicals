//
//  MapView.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/20.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 40.758_644, longitude: -73.987_442))
}
