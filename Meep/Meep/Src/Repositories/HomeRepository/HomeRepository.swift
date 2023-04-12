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
    
    func getLocations(completion: @escaping (Result<[LocationModel], Error>) -> Void) {
        apiClient.sendRequest(endpoint: EndpointModel.mock, responseModel: [LocationDTO].self) { response in
            switch response {
            case .success(let locations):
                let locations = locations.map { $0.mapToModel }
                completion(.success(locations))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
