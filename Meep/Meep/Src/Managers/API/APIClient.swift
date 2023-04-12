//
//  ApiClient.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation

protocol APIClientProtocol {
    func sendRequest<T: Decodable>(endpoint: EndpointModel, responseModel: T.Type, closure: @escaping (Result<T, RequestErrors>) -> Void)
}

class APIClient: APIClientProtocol {
    
    func sendRequest<T: Decodable>(
        endpoint: EndpointModel,
        responseModel: T.Type,
        closure: @escaping (Result<T, RequestErrors>) -> Void) {
            
            guard let url = URL(string: Bundle.main.apiBaseUrl ?? "") else {
                closure(.failure(.invalidURL))
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = endpoint.method.rawValue
            request.allHTTPHeaderFields = endpoint.header
            
            if let body = endpoint.body { request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: []) }
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    guard let response = response as? HTTPURLResponse, let data = data else {
                        closure(.failure(.noResponse))
                        return
                    }
                    
                    switch response.statusCode {
                    case 200...299:
                        guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                            closure(.failure(.decode))
                            return
                        }
                        closure(.success(decodedResponse))
                    case 401:
                        closure(.failure(.unauthorized))
                    case 429:
                        closure(.failure(.tooManyRequest))
                    default:
                        closure(.failure(.unexpectedStatusCode))
                    }
                }
            }.resume()
        }
}


