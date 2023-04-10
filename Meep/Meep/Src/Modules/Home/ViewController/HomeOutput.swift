//
//  HomeOutput.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

protocol HomeOutput: AnyObject {
    func receive(state: HomeStates)
}

enum HomeStates {
    case loading
    case loaded([LocationModel])
    case error
}
