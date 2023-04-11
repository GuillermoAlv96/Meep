//
//  Views.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

extension Molecules.Views {
    static var mapView: GoogleMapView {
        GoogleMapView()
    }
    
    static var markerInfoWindowView: MarkerInfoWindowView {
        MarkerInfoWindowView()
    }
    
    static var markerView: MarkerView {
        MarkerView()
    }
}
