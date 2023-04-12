//
//  MarkerView.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 11/4/23.
//

import UIKit

class MarkerInfoWindowView: UIView {
    
    private let txtLabel = Atoms.Labels.txtLabel
    private let imgView = UIImageView()
    private let chevronButton = UIButton()
    
    private var buttonAction = {}
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func binding(model: MarkerInfoModel, action: @escaping () -> Void) {
        backgroundColor = model.backGroundColor
        txtLabel.text = model.title
        imgView.image = model.image
        buttonAction = action
    }
    
    func configureConstraints() {
        setupViews()
        
        addSubview(imgView)
        addSubview(txtLabel)
        addSubview(chevronButton)
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: topAnchor),
            imgView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacings.spacingS),
            imgView.widthAnchor.constraint(equalToConstant: Spacings.spacingH),
            imgView.heightAnchor.constraint(equalToConstant: Spacings.spacingXxl),
            
            txtLabel.topAnchor.constraint(equalTo: topAnchor),
            txtLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            txtLabel.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: Spacings.spacingM),
            txtLabel.trailingAnchor.constraint(equalTo: chevronButton.leadingAnchor, constant: -Spacings.spacingM),
            
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
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 5
        imgView.layer.masksToBounds = true
        imgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        imgView.translatesAutoresizingMaskIntoConstraints = false

        chevronButton.setImage(UIImage(named: Strings.chevron), for: .normal)
        
        chevronButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        chevronButton.tintColor = .black
        chevronButton.isUserInteractionEnabled = true
        chevronButton.translatesAutoresizingMaskIntoConstraints = false
        
        txtLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func buttonTapped() {
        buttonAction()
    }
}
