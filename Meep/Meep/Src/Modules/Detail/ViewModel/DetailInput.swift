//
//  DetailInput.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 12/4/23.
//

import Foundation

protocol DetailInput: AnyObject {
    func update(event: DetailEvents)
    func numberOfSections() -> Int
    func numberOfRowIn() -> Int
    func detailCell(index: Int) -> DetailCellModel
}

enum DetailStates {
    case loaded
}
