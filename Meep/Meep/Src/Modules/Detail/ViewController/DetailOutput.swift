//
//  DetailOutput.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 12/4/23.
//

import Foundation

protocol DetailOutput: AnyObject {
    func receive(state: DetailStates)
}

enum DetailEvents {
    case viewLoaded
}
