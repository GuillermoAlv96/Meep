//
//  HomeRouter.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import UIKit

extension HomeCoordinator: HomeRouter {
    
    func showAlert(alertModel: AlertModel) {
        let alert = UIAlertController(title: Strings.error, message: alertModel.text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Strings.retry, style: .default) { [weak self] action in
            guard let self = self else { return }
            self.dismissAlert()
            alertModel.action()
        })
        presentedViewController?.present(alert, animated: true)
    }
    
    private func dismissAlert() {
        presentedViewController?.dismiss(animated: true)
    }
    
    func showDetail(location: LocationModel) {
        let detailViewModel = DetailViewModel(location: location)
        let detailViewController = DetailViewController(input: detailViewModel)
        detailViewModel.output = detailViewController
        
        presentedViewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
