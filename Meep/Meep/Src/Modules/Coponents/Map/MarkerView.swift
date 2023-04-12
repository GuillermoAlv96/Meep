//
//  MarkerView.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 11/4/23.
//

import UIKit

class MarkerView: UIView {
    
    private let imgView = UIImageView()
    private let triangleImgView = UIImageView()
    
    required init() {
        super.init(frame: .zero)
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func binding(model: MarkerIconModel) {
        imgView.layer.borderColor = model.color.cgColor
        triangleImgView.image = model.image
    }
    
    func configureConstraints() {
        
        setupViews()
        
        addSubview(imgView)
        imgView.addSubview(triangleImgView)
        
        NSLayoutConstraint.activate([
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imgView.topAnchor.constraint(equalTo: topAnchor),
            imgView.heightAnchor.constraint(equalToConstant: Spacings.spacingXl),
            
            triangleImgView.centerYAnchor.constraint(equalTo: imgView.centerYAnchor),
            triangleImgView.centerXAnchor.constraint(equalTo: imgView.centerXAnchor),
            triangleImgView.heightAnchor.constraint(equalToConstant: Spacings.spacingMm),
            triangleImgView.widthAnchor.constraint(equalToConstant: Spacings.spacingMm)
        ])
    }
    
    func setupViews() {

        imgView.backgroundColor = .black
        imgView.layer.cornerRadius = Spacings.spacingMs
        imgView.contentMode = .scaleAspectFill
        imgView.layer.borderWidth = 2
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        triangleImgView.tintColor = .white
        triangleImgView.translatesAutoresizingMaskIntoConstraints = false
       
    }
}
