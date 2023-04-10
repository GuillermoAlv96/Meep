//
//  HomeViewModel.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

@MainActor class HomeViewModel {
    
    weak var output: HomeOutput?
    weak var router: HomeRouter?
    
    private var homeRepository: HomeRepositoryProtocol
    
    private var currentState: HomeStates = .loading {
        didSet {
            output?.receive(state: currentState)
        }
    }
    
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    
    private func fetchData() {
        Task {
            let result = await homeRepository.getLocations()
            
            switch result {
            case .success(let locations):
                currentState = .loaded(locations)
            case .failure(_):
                currentState = .error
            }
        }
    }
}

extension HomeViewModel: HomeInput {
    func update(event: HomeEvents) {
        switch event {
        case .viewLoaded:
            output?.receive(state: .loading)
            fetchData()
        }
    }
}
