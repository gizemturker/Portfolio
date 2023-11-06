//
//  LocationsViewModel.swift
//  HatayEarthquakeMemorial
//
//  Created by Gizem Turker on 14.04.2023.
//

import Foundation
import SwiftUI
import MapKit


class LocationsViewModel: ObservableObject {
    @Published var locations : [Location]
    
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationList: Bool = false
    
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
        
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationList = !showLocationList
        }
    }
    
    func showNextLocation(location: Location){
        withAnimation(.easeOut) {
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed() {
        
        guard let currenIndex = locations.firstIndex(where: { $0 == mapLocation}) else {
            print("Could not find current index in locations array! Should never happen.")
            return
        }
        let nextIndex = currenIndex + 1
        guard locations.indices.contains(nextIndex) else {
  
            guard let firstLocation = locations.first else {  return }
            showNextLocation(location: firstLocation)
            return
        }

        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)

    }
}
