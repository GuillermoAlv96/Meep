//
//  RequestErrors.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

//RequestError contains some possible errors that the HTTPClient will identify and return
enum RequestErrors: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case tooManyRequest
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
