//
//  DetailViewModel.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 12/4/23.
//

import Foundation

class DetailViewModel {
    
    weak var output: DetailOutput?
    //    weak var router: SessionsViewRouter?
    private var location: LocationModel
    private var cells = [DetailCellModel]()
    private var sections = 0
    private var rows = 0
    
    init(output: DetailOutput? = nil, location: LocationModel) {
        self.output = output
        self.location = location
    }
    
    private var currentState: DetailStates? {
        didSet {
            guard let currentState = currentState else { return }
            if currentState == .loaded {
                sections = 1
                rows = cells.count
            }
            output?.receive(state: currentState)
        }
    }
}

extension DetailViewModel: DetailInput {
    
    func numberOfSections() -> Int {
        sections
    }
    
    func numberOfRowIn() -> Int {
        rows
    }
    
    func detailCell(index: Int) -> DetailCellModel {
        let cellModel = location.mapToArray()
        return cellModel[index]
    }
    
    func update(event: DetailEvents) {
        switch event {
        case .viewLoaded:
            cells = location.mapToArray()
            currentState = .loaded
        }
    }
}
