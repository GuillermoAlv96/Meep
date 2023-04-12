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
}
