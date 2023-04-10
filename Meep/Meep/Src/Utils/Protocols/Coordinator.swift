//
//  Coordinator.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var presentedViewController: UIViewController? { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
}
