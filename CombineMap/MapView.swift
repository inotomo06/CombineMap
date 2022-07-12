//
//  MapViiew.swift
//  CombineMap
//
//  Created by cmStudent on 2022/07/12.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var mapViewModel = MapViewModel()
    var body: some View {
        
        Map(
            coordinateRegion: $mapViewModel.region,
            annotationItems: mapViewModel.mapItems
        ) { mapItems in
            MapMarker(coordinate: mapItems.coordinator, tint: mapItems.color)
        }
        .ignoresSafeArea()
    }
}
