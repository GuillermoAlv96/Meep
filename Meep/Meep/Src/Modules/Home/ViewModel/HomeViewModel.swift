//
//  HomeViewModel.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

final class HomeViewModel {
    
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
        
        homeRepository.getLocations() { [weak self] response in
            
            guard let self = self else { return }
            
            switch response {
            case .success(let locations):
                guard let pictureFrame = locations.first?.pictureFrame else {
                    self.output?.receive(state: .error)
                    self.router?.showAlert(alertModel: AlertModel(
                        text: Strings.tryAgain,
                        action: self.fetchData))
                    return
                }
                let markers = locations.map { location in
                    location.mapToMarkers(action: {
                        self.router?.showDetail(location: location)
                    })
                }
                
                self.currentState = .loaded(MapModel(cameraPosition: pictureFrame, markers: markers))
            case .failure(let error):
                self.output?.receive(state: .error)
                self.router?.showAlert(alertModel: AlertModel(
                    text: error.localizedDescription,
                    action: self.fetchData))
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
