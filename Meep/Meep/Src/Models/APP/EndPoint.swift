//
//  EndPoint.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

struct Endpoint {
    let baseURL: String
    var path: String? = nil
    var method: RequestMethods = .get
    var header: [String: String]? = nil
    let body: [String: String]? = nil
}

extension Endpoint {
    
    static var mock: Endpoint {
        Endpoint(
            baseURL: "https://apidev.meep.me/tripplan/api/v1/routers/lisboa/resources?lowerLeftLatLon=38.711046,-9.160096&upperRightLatLon=38.739429,-9.137115",
            method: .get,
            header: ["User-Agent": "Meep/iOS/1.0.0", "accept": "application/json"]
        )
    }
}
