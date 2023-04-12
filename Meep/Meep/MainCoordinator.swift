//
//  MainCoordinator.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import UIKit

class MainCoordinator: Coordinator {
    var presentedViewController: UIViewController?
    var childCoordinators = [Coordinator]()
    
    private let navigationController: UINavigationController
    private let repositoryProvider: RepositoryProviderProtocol
    
    init(navigationController: UINavigationController, repositoryProvider: RepositoryProviderProtocol) {
        self.navigationController = navigationController
        self.repositoryProvider = repositoryProvider
    }
    
    func start() {
        let coordinator = HomeCoordinator(
            navigationController: navigationController,
            homeRepository: repositoryProvider.homeRepository)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
