//
//  MarkerView.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 11/4/23.
//

import UIKit

class MarkerInfoWindowView: UIView {
    
    private let txtLabel = Atoms.Labels.txtLabel
    private let subtitleLabel = Atoms.Labels.subtitleLabel
    private let chevronButton = UIButton()
    private let imgView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func binding(model: MarkerInfoModel) {
        backgroundColor = model.backGroundColor
        txtLabel.text = model.title
        subtitleLabel.text = model.subtitle
        imgView.image = model.image
    }
    
    func configureConstraints() {
        setupViews()
        
        addSubview(imgView)
        addSubview(txtLabel)
        addSubview(subtitleLabel)
        addSubview(chevronButton)
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: topAnchor),
            imgView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgView.widthAnchor.constraint(equalToConstant: Spacings.spacingH),
            imgView.heightAnchor.constraint(equalToConstant: Spacings.spacingXxl),
            
            txtLabel.topAnchor.constraint(equalTo: topAnchor, constant: Spacings.spacingMs),
            txtLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: Spacings.spacingMs),
            txtLabel.trailingAnchor.constraint(equalTo: chevronButton.leadingAnchor, constant: -Spacings.spacingMs),
            
            subtitleLabel.topAnchor.constraint(equalTo: txtLabel.bottomAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: txtLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: chevronButton.leadingAnchor),
            
            chevronButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacings.spacingMs),
            chevronButton.widthAnchor.constraint(equalToConstant: Spacings.spacingXl),
            chevronButton.heightAnchor.constraint(equalToConstant: Spacings.spacingXl)
        ])
    }
    
    private func setupViews() {
        backgroundColor = .purple
        layer.masksToBounds = true
        layer.cornerRadius = 5
        
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 5
        imgView.layer.masksToBounds = true
        imgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        imgView.translatesAutoresizingMaskIntoConstraints = false

        chevronButton.setImage(UIImage(named: Strings.chevron), for: .normal)
        chevronButton.tintColor = .black
        chevronButton.isUserInteractionEnabled = true
        chevronButton.translatesAutoresizingMaskIntoConstraints = false
        
        txtLabel.numberOfLines = 2
        txtLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subtitleLabel.numberOfLines = 0
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false 
    }
}
