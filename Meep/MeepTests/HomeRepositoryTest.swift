//
//  HomeRepositoryTest.swift
//  MeepTests
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation
import XCTest
@testable import Meep

class HomeRepositoryTest: XCTestCase {
    
    func test_start_withEmpty_getLocations_locationsNotNillAndCountZero() {
        let sut = makeSUT(scenario: .empty)
        
        let expectation = expectation(description: "Retrieve locations")
        
        sut.getLocations() { response in
            switch response {
            case .success(let locations):
                XCTAssertEqual(locations.count, 0)
                expectation.fulfill()
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    func test_start_withData_getLocations_locationsNotNillAndCountTwo() {
        
        let sut = makeSUT(scenario: .data)
        let expectation = expectation(description: "Retrieve locations")
        
        sut.getLocations() { response in
            switch response {
            case .success(let locations):
                XCTAssertEqual(locations.count, 2)
                expectation.fulfill()
            case .failure(let failure):
                XCTFail(failure.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    func test_start_withError_getLocations_locationsNotNillAndCountThree() {
        let sut = makeSUT(scenario: .error)
        
        let expectation = expectation(description: "Retrieve locations")
        
        sut.getLocations() { response in
            switch response {
            case .success(let locations):
                XCTFail("\(locations) shoudn be nil")
            case .failure(let failure):
                XCTAssertNotNil(failure)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    // MARK: HELPERS
    
    enum Scenarios {
        case data
        case empty
        case error
    }
    
    func makeSUT(scenario: Scenarios) -> HomeRepository {
        HomeRepository(apiClient: FakeApiClient(scenario: scenario))
    }
    
    class FakeApiClient: APIClientProtocol {
      
        var scenario: Scenarios
        
        init(scenario: Scenarios) {
            self.scenario = scenario
        }
        
    func sendRequest<T>(endpoint: Meep.EndpointModel, responseModel: T.Type, closure: @escaping (Result<T, Meep.RequestErrors>) -> Void) where T : Decodable {
            switch scenario {
            case .data:
                guard let model = LocationDTO.contained as? T else {
                    XCTFail("Model is not APIResponse type")
                    closure(.failure(.unknown))
                    return
                }
                closure(.success(model))
            case .empty:
                guard let model = LocationDTO.empty as? T else {
                    XCTFail("Model is not APIResponse type")
                    closure(.failure(.unknown))
                    return
                }
                closure(.success(model))
            case .error:
                closure(.failure(.unknown))
            }
        }
    }
    
}
