//
//  Position.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

struct PositionModel: Equatable {
    
    let latitude: Double
    let longitude: Double
    
    static var empty: PositionModel {
        PositionModel(latitude: 0.0, longitude: 0.0)
    }
    
    init(
        latitude: Double?,
        longitude: Double?
    ) {
        self.latitude = latitude ?? 0.0
        self.longitude = longitude ?? 0.0
    }
}
