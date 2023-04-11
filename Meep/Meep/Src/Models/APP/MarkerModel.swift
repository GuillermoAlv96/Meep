//
//  MarkerModel.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 11/4/23.
//

import UIKit

struct MarkerModel: Equatable {
    let name: String?
    let position: PositionModel
    let companyZoneId: CompanyZone
    
    var markerTitle: String {
        switch companyZoneId {
        case .bus:
            return Strings.busStop
        case .bike:
            return Strings.bikeStop
        case .scooter:
            return Strings.scooterStop
        case .unknown:
            return "unkown"
        }
    }
    
    var markerIcon: MarkerIconModel {
        switch companyZoneId {
        case .bus:
            return MarkerIconModel(color: .yellow, image: UIImage(systemName: Strings.bus))
        case .bike:
            return MarkerIconModel(color: .green, image: UIImage(systemName: Strings.bicycle))
        case .scooter:
            return MarkerIconModel(color: .blue, image: UIImage(systemName: Strings.scooter))
        case .unknown:
            return MarkerIconModel(color: .red, image: UIImage(named: ""))
        }
    }
    
    var markerInfo: MarkerInfoModel {
        switch companyZoneId {
        case .bus:
            return MarkerInfoModel(
                title: markerTitle,
                subtitle: name,
                backGroundColor: markerIcon.color,
                image: markerIcon.image)
        case .bike:
            return MarkerInfoModel(
                title: markerTitle,
                subtitle: name,
                backGroundColor: markerIcon.color,
                image: markerIcon.image)
        case .scooter:
            return MarkerInfoModel(
                title: markerTitle,
                subtitle: name,
                backGroundColor: markerIcon.color,
                image: markerIcon.image)
        case .unknown:
            return MarkerInfoModel(
                title: markerTitle,
                subtitle: name,
                backGroundColor: markerIcon.color,
                image: markerIcon.image)
        }
    }
}


