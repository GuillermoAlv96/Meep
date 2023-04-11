//
//  Labels.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 11/4/23.
//

import UIKit

extension Atoms.Labels {
    
    static var txtLabel: UILabel {
        let txtLabel = UILabel()
        txtLabel.font = UIFont.boldSystemFont(ofSize: 16)
        txtLabel.textColor = .black
        return txtLabel
    }
    
    static var subtitleLabel: UILabel {
        let subtitleLabel = UILabel()
        subtitleLabel.font =  UIFont.systemFont(ofSize: 14, weight: .light)
        subtitleLabel.textColor = .black
        return subtitleLabel
    }
}
