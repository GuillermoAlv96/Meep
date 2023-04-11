//
//  EndPoint.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

struct EndpointModel {
    var path: String? = nil
    var method: RequestMethods = .get
    var header: [String: String]? = nil
    let body: [String: String]? = nil
}

extension EndpointModel {
    
    static var mock: EndpointModel {
        return EndpointModel(
            method: .get,
            header: ["User-Agent": "Meep/iOS/1.0.0", "accept": "application/json"]
        )
    }
}
