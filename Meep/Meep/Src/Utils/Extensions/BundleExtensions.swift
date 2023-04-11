//
//  Bundle.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 11/4/23.
//

import Foundation

extension Bundle {
    var apiBaseUrl: String? {
        return object(forInfoDictionaryKey: "API Base Url") as? String
    }
    
    var googleKey: String? {
        return object(forInfoDictionaryKey: "API Base Url") as? String
    }
    
    var styleURL: URL? {
        return url(forResource: Strings.style, withExtension: Strings.json)
    }
}
