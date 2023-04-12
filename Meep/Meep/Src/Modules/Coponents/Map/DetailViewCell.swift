//
//  DetailViewCell.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 12/4/23.
//

import UIKit

class DetailViewCell: UITableViewCell {
    
    private let view = DetailCellView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func binding(model: DetailCellModel) {
        view.binding(model: model)
    }
    
    private func configureConstraints() {
        setupViews()
        
        addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: Spacings.spacingS),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Spacings.spacingS),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacings.spacingS),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacings.spacingS)
        ])
    }
    
    private func setupViews() {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

class DetailCellView: UIView {
    
    private let horizontalStack = UIStackView()
    private let titleLabel = Atoms.Labels.txtLabel
    private let contentLabel = Atoms.Labels.txtLabel
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func binding(model: DetailCellModel) {
        titleLabel.text = model.title
        contentLabel.text = model.content
    }
    
    private func configureConstraints() {
        
        setupViews()
        
        horizontalStack.addArrangedSubview(titleLabel)
        horizontalStack.addArrangedSubview(contentLabel)
        addSubview(horizontalStack)
        
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: topAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupViews() {
        
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = Spacings.spacingM
        horizontalStack.alignment = .center
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
    }
}
