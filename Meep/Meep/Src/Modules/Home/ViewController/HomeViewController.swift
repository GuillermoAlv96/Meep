//
//  ViewController.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let input: HomeInput
    private let mapView = Molecules.Views.mapView
    
    init(input: HomeInput) {
        self.input = input
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        input.update(event: .viewLoaded)
    }
    
    private func configureConstraints() {
        
        setupViews()
        
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupViews() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension HomeViewController: HomeOutput {
    func receive(state: HomeStates) {
        switch state {
        case .loading:
            showLoadingScreen(onView: view)
        case .loaded(let model):
            mapView.binding(model: model)
            dismissLoadingScreen()
        case .error:
            dismissLoadingScreen()
        }
    }
}



