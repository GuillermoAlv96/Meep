//
//  HomeCoordinator.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var presentedViewController: UIViewController?
    var childCoordinators = [Coordinator]()
    
    private let navigationController: UINavigationController
    private let homeRepository: HomeRepositoryProtocol
    
    init(navigationController: UINavigationController, homeRepository: HomeRepositoryProtocol) {
        self.navigationController = navigationController
        self.homeRepository = homeRepository
    }
    
    func start() {
        let homeViewController = HomeViewController()
        
        navigationController.viewControllers = [homeViewController]
        presentedViewController = homeViewController
    }
}

