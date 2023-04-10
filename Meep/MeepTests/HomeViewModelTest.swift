//
//  HomeViewModelTest.swift
//  MeepTests
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation
import XCTest
@testable import Meep

@MainActor class HomeViewModelTest: XCTestCase {
    
    var fakeOutput = HomeViewModelFakeOutput()
    
    func test_start_viewDidLoad_then_isLoading() {
        
        let sut = makeSut(scenario: .empty)
        
        // GIVEN
        XCTAssertFalse(fakeOutput.isLoadingState)
        sut.update(event: .viewLoaded)
        
        // THEN
        XCTAssertTrue(fakeOutput.isLoadingState)
    }

    //MARK: HELPERS
    
    enum Scenarios {
        case data
        case empty
        case error
    }
    
    @MainActor func makeSut(scenario: Scenarios) -> HomeViewModel {
        let sut = HomeViewModel(homeRepository: HomeFakeRepository(scenario: scenario))
        sut.output = fakeOutput
        return sut
    }
    
    class HomeViewModelFakeOutput: HomeOutput {
        var isLoadingState = false
        var isLoaded = false
        var isError = false
        var locations: [LocationModel]?
        
        func receive(state: Meep.HomeStates) {
            switch state {
            case .loading:
                isLoadingState = true
            case .loaded(let locations):
                isLoaded = true
                self.locations = locations
            case .error:
                isError = true
            }
        }
    }
    
    class HomeFakeRepository: HomeRepositoryProtocol {
        
        private let scenario: Scenarios
        
        init(scenario: Scenarios) {
            self.scenario = scenario
        }
        
        func getLocations() async -> Result<[Meep.LocationModel], Error> {
            
            switch scenario {
            case .data:
                return .success(LocationModel.contained)
            case .empty:
                return .success(LocationModel.empty)
            case .error:
                return .failure(RequestErrors.decode)
            }
        }
    }
}
