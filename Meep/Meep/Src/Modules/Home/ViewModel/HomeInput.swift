//
//  HomeInput.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

protocol HomeInput: AnyObject {
    func update(event: HomeEvents)
}

enum HomeEvents {
    case viewLoaded
}
