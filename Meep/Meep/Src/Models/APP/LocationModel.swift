//
//  Location.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

struct LocationModel {
    var name: String?
    var pictureFrame: PositionModel
    var scheduledArrival: Int?
    var locationType: Int?
    var taxable: Bool?
    var companyZoneID: CompanyZone
    var latLng: PositionModel
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

extension LocationModel {
    func mapToMarkers(action: @escaping () -> Void) -> MarkerModel {
        MarkerModel(
            name: name,
            position: latLng,
            companyZoneId: companyZoneID,
            action: action)
    }
    
    func mapToArray() -> [DetailCellModel] {
        var sectionSessions = [DetailCellModel]()
        
        if let name = name {
            sectionSessions.append(DetailCellModel(title: Strings.name, content: name))
        }
        
        if let scheduledArrival = scheduledArrival {
            sectionSessions.append(DetailCellModel(title: Strings.scheduledArrival, content: "\(scheduledArrival)"))
        }
        
        if let taxable = taxable {
            sectionSessions.append(DetailCellModel(title: Strings.taxable, content: "\(taxable)"))
        }
      
        return sectionSessions
    }
}


