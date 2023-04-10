//
//  ViewController.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let input: HomeInput
    
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
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .red
    }
}

extension HomeViewController: HomeOutput {
    func receive(state: HomeStates) {
        switch state {
        case .loading:
            showLoadingScreen(onView: view)
        case .loaded(_):
            dismissLoadingScreen()
        case .error:
            dismissLoadingScreen()
        }
    }
}


