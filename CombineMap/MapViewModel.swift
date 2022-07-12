//
//  MapViewModel.swift
//  CombineMap
//
//  Created by cmStudent on 2022/07/12.
//

import MapKit
import Combine
import SwiftUI
//import CoreLocation


struct MapItems: Identifiable {
    var id = UUID().uuidString
    var coordinator = CLLocationCoordinate2D()
    var color = Color.orange
}

final class MapViewModel: ObservableObject {
    
    // Initial value is Elizabeth Tower.
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.50093622043166,
                                                                              longitude: -0.12464685967583804),
                                               span: MKCoordinateSpan(latitudeDelta: 0.01 , longitudeDelta: 0.01)
    )
    
    // For half-modal
    @Published var isShowSearch = false
    
    @Published var mapItems: [MapItems] = []
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        $region
            .debounce(for: 1, scheduler: DispatchQueue.main)
            .sink { region in
                // Reset the array to reposition the pins once the map has been moved.
                self.mapItems.removeAll()
                let pinItems = MapItems(coordinator: region.center, color: .orange)
                self.mapItems.append(pinItems)
            }
            .store(in: &cancellable)
    }
    
    // for searching
    //    func search(searchKey: String) {
    //        let geocoder = CLGeocoder()
    //
    //        geocoder.geocodeAddressString(searchKey) { (placemarks, error) in
    //
    //            if let unwrapPlacemarks = placemarks ,
    //               let firstPlacemark = unwrapPlacemarks.first ,
    //               let location = firstPlacemark.location {
    //
    //                let targetCoordinate = location.coordinate
    //                print(targetCoordinate)
    //                self.lat = targetCoordinate.latitude
    //                self.lng = targetCoordinate.longitude
    //                self.setRegion()
    //            }
    //        }
    //    }
    
}

