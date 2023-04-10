//
//  LocationDTO.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

struct LocationDTO: Decodable {
    var id: String?
    var name: String?
    var x: Double?
    var y: Double?
    var scheduledArrival: Int?
    var locationType: Int?
    var taxable: Bool?
    var companyZoneId: Int?
    var lat: Double?
    var lon: Double?
    var licencePlate: String?
    var range: Int?
    var helmets: Int?
    var realTimeData: Bool?
    var station: Bool?
    var availableResources: Int?
    var spacesAvailable: Int?
    var allowDropoff: Bool?
    var bikesAvailable: Int?
}

extension LocationDTO {
    var mapToModel: LocationModel {
        LocationModel(
            name: name,
            pictureFrame: mapToPictureFrame(),
            scheduledArrival: scheduledArrival,
            locationType: locationType,
            taxable: taxable,
            companyZoneID: mapCompanyZoneId(),
            latLng: mapToLatLng(),
            licencePlate: licencePlate,
            range: range,
            helmets: helmets,
            realTimeData: realTimeData,
            station: station,
            availableResources: availableResources,
            spacesAvailable: spacesAvailable,
            allowDropoff: allowDropoff,
            bikesAvailable: bikesAvailable)
    }
    
    func mapToPictureFrame() -> PositionModel {
        PositionModel(latitude: y, longitude: x)
    }
    
    func mapToLatLng() -> PositionModel {
        PositionModel(latitude: y, longitude: x)
    }
    
    func mapCompanyZoneId() -> CompanyZone {
        
        guard let companyZoneId = companyZoneId else { return .unknown }
        switch companyZoneId {
        case 378:
            return .one
        case 473:
            return .two
        case 412:
            return .three
        default:
            return .unknown
        }
    }
}

