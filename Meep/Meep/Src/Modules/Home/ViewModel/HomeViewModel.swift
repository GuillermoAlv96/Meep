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
        
        output?.receive(state: .loading)
        Task {
            let result = await homeRepository.getLocations()
            
            switch result {
            case .success(let locations):
                guard let pictureFrame = locations.first?.pictureFrame else { return }
                let markers = locations.map { $0.mapToMarkers() }
                currentState = .loaded(MapModel(cameraPosition: pictureFrame, markers: markers))
            case .failure(let error):
                output?.receive(state: .error)
                router?.showAlert(alertModel: AlertModel(text: error.localizedDescription, action: fetchData))
            }
        }
    }
}

extension HomeViewModel: HomeInput {
    func update(event: HomeEvents) {
        switch event {
        case .viewLoaded:
            fetchData()
        }
    }
}
