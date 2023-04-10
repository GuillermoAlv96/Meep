//
//  HomeRepository.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

class HomeRepository: HomeRepositoryProtocol {
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getLocations() async -> Result<[LocationModel], Error> {
        let request = await apiClient.sendRequest(endpoint: EndpointModel.mock, responseModel: [LocationDTO].self)
        
        switch request {
        case .success(let locations):
            let locations = locations.map { $0.mapToModel }
            return .success(locations)
        case .failure(let error):
            return .failure(error)
        }
    }
}
