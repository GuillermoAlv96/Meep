//
//  HomeRepositoryProtocol.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

protocol HomeRepositoryProtocol {
    func getLocations(completion: @escaping (Result<[LocationModel], Error>) -> Void)
}
