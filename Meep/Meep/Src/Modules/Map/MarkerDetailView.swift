//
//  MarkerView.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 11/4/23.
//

import UIKit

class MarkerDetailView: UIView {
    
    
    let imageView = UIImageView()
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    func binding() {
        
    }
    
    func configureConstraints() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setup() {
        
    }
}
