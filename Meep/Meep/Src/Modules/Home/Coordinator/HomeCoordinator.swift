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
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    @MainActor func start() {
        let homeViewController = HomeViewController()
        
        navigationController.viewControllers = [homeViewController]
        presentedViewController = homeViewController
    }
}

