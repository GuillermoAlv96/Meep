//
//  MarkerModel.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 11/4/23.
//

import UIKit

struct MarkerModel {
    let name: String?
    let position: PositionModel
    let companyZoneId: CompanyZone
    
    var markerIcon: UIImageView {
    
        let imageView = UIImageView(image: UIImage(systemName: Strings.markerIcon))
        
        switch companyZoneId {
        case .one:
            imageView.tintColor = .red
            return imageView
        case .two:
            imageView.tintColor = .blue
            return imageView
        case .three:
            imageView.tintColor = .green
            return imageView
        case .unknown:
            imageView.tintColor = .gray
            return imageView
        }
    }
    
    var markerTitle: String {
        switch companyZoneId {
        case .one:
            return Strings.busStop
        case .two:
            return Strings.bikeStop
        case .three:
            return Strings.scooterStop
        case .unknown:
            return "unkown"
        }
    }
}


