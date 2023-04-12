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
    private var homeRepository: HomeRepositoryProtocol
    
    init(navigationController: UINavigationController, homeRepository: HomeRepositoryProtocol) {
        self.navigationController = navigationController
        self.homeRepository = homeRepository
    }
    
    func start() {
        let homeViewModel = HomeViewModel(homeRepository: homeRepository)
        let homeViewController = HomeViewController(input: homeViewModel)
        homeViewModel.output = homeViewController
        homeViewModel.router = self
        
        navigationController.viewControllers = [homeViewController]
        presentedViewController = homeViewController
    }
}

