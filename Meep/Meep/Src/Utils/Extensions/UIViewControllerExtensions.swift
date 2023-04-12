//
//  UIViewControllerExtensions.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import UIKit

extension UIViewController {
    struct Holder {
        static var indicator: UIView?
        static var alertView: AlertView?
    }
    
    var indicatorView: UIView? {
        get {
            return Holder.indicator
        }
        set(newValue) {
            Holder.indicator = newValue
        }
    }
    
    func showLoadingScreen(onView: UIView) {
        
        indicatorView = UIView.init(frame: onView.bounds)
        guard let indicatorView = indicatorView else { return }
        indicatorView.backgroundColor = .clear.withAlphaComponent(0.4)
        
        let indicator = Atoms.Loaders.Screen.large
        indicator.center = indicatorView.center
        
        indicatorView.addSubview(indicator)
        onView.addSubview(indicatorView)
    }
    
    func dismissLoadingScreen() {
        indicatorView?.removeFromSuperview()
        indicatorView = nil
    }
    
    var alertView: AlertView? {
        get {
            return Holder.alertView
        }
        set(newValue) {
            Holder.alertView = newValue
        }
    }
    
    func showAlertScreen(onView: UIView, alertModel: AlertModel) {
        alertView = AlertView()
        guard let alertView = alertView else { return }
        alertView.binding(model: alertModel)
        onView.addSubview(alertView)
    }
    
    func dismissAlertScreen() {
        alertView?.removeFromSuperview()
        alertView = nil
    }
}
