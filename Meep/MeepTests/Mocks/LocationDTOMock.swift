//
//  LocationDTOMock.swift
//  MeepTests
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation
@testable import Meep

extension LocationDTO {
    
    static var contained: [LocationDTO] =
        [
            LocationDTO(
                id: "0",
                name: "lisbon",
                x: 12.111,
                y: 11.222,
                scheduledArrival: 413,
                locationType: 1,
                taxable: true,
                companyZoneId: 413,
                lat: 12.111,
                lon: 11.222,
                licencePlate: "",
                range: 2,
                helmets: 0,
                realTimeData: true,
                station: true,
                availableResources: 0,
                spacesAvailable: 1,
                allowDropoff: false,
                bikesAvailable: 0),
            
            LocationDTO(
                id: "1",
                name: "lisbon",
                x: 10.111,
                y: 10.222,
                scheduledArrival: 413,
                locationType: 1,
                taxable: false,
                companyZoneId: 413,
                lat: 10.111,
                lon: 10.222,
                licencePlate: "",
                range: 2,
                helmets: 0,
                realTimeData: true,
                station: true,
                availableResources: 0,
                spacesAvailable: 1,
                allowDropoff: false,
                bikesAvailable: 0),
            
        ]
    
    static var empty: [LocationDTO] = [] 
    
}
