//
//  LocationMock.swift
//  MeepTests
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation
@testable import Meep

extension LocationModel {
    
    static let contained = [
        LocationModel(
            name: "London",
            pictureFrame: PositionModel(latitude: 11.111, longitude: 12.222),
            companyZoneID: .bus,
            latLng: PositionModel(latitude: 11.111, longitude: 12.222)
        ),
        LocationModel(
            name: "Madrid",
            pictureFrame: PositionModel(latitude: 11.111, longitude: 12.222),
            companyZoneID: .bike,
            latLng: PositionModel(latitude: 11.111, longitude: 12.222)
        )
    ]
    
    static let empty = [LocationModel]()
}
