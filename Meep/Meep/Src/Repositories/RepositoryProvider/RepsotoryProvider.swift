//
//  RepsotoryProvider.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

class RepositoryProvider: RepositoryProviderProtocol {
    var homeRepository: HomeRepositoryProtocol
    
    init(apiClient: APIClientProtocol) {
        self.homeRepository = HomeRepository(apiClient: apiClient)
    }
}
