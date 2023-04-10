//
//  Loaders.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import UIKit

extension Atoms.Loaders {
    public enum Screen {
        public static var large: UIActivityIndicatorView {
            let indicator = UIActivityIndicatorView.init(style: .large)
            indicator.color = .white
            indicator.startAnimating()
            return indicator
        }
    }
}
