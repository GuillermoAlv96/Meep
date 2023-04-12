//
//  HomeViewModelTest.swift
//  MeepTests
//
//  Created by Alvarez de Lorenzana, Guillermo on 10/4/23.
//

import Foundation
import XCTest
@testable import Meep

class HomeViewModelTest: XCTestCase {
    
    var fakeOutput = HomeViewModelFakeOutput()
    var fakeRouter = HomeFakeRouter()
    
    func test_start_viewDidLoad_then_isLoading() {
        
        let sut = makeSut(scenario: .empty)
        
        XCTAssertFalse(fakeOutput.isLoadingState)
        sut.update(event: .viewLoaded)
        
        XCTAssertTrue(fakeOutput.isLoadingState)
    }
    
    func test_start_withEmpty_then_isErrorAndHasNoData() {
        
        let sut = makeSut(scenario: .empty)
        
        XCTAssertFalse(fakeOutput.isLoadingState)
        sut.update(event: .viewLoaded)
         
        XCTAssertTrue(fakeOutput.isError)
        XCTAssertNil(fakeOutput.mapModel)
        XCTAssertTrue(fakeRouter.isErrorShown)
    }
    
    func test_start_withData_then_isLoadedAndHasData() {
        
        let sut = makeSut(scenario: .data)
        
        XCTAssertFalse(fakeOutput.isLoadingState)
        sut.update(event: .viewLoaded)
         
        XCTAssertTrue(fakeOutput.isLoaded)
        XCTAssertNotNil(fakeOutput.mapModel)
        XCTAssertFalse(fakeRouter.isErrorShown)
    }
    
    func test_start_withError_then_isErrorAndHasNoData() {
        
        let sut = makeSut(scenario: .error)
        
        XCTAssertFalse(fakeOutput.isLoadingState)
        sut.update(event: .viewLoaded)
         
        XCTAssertTrue(fakeOutput.isError)
        XCTAssertNil(fakeOutput.mapModel)
        XCTAssertTrue(fakeRouter.isErrorShown)
    }
    
    //MARK: HELPERS
    
    enum Scenarios {
        case data
        case empty
        case error
    }
    
    func makeSut(scenario: Scenarios) -> HomeViewModel {
        let sut = HomeViewModel(homeRepository: HomeFakeRepository(scenario: scenario))
        sut.output = fakeOutput
        sut.router = fakeRouter
        return sut
    }
    
    class HomeFakeRouter: HomeRouter {
        
        var isErrorShown = false
        
        func showAlert(alertModel: Meep.AlertModel) {
            isErrorShown = true
        }
        
        func showDetail(location: Meep.LocationModel) {}
        
    }
    
    class HomeViewModelFakeOutput: HomeOutput {
        var isLoadingState = false
        var isLoaded = false
        var isError = false
        var mapModel: MapModel?
        
        func receive(state: Meep.HomeStates) {
            switch state {
            case .loading:
                isLoadingState = true
            case .loaded(let locations):
                isLoaded = true
                self.mapModel = locations
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
        
        func getLocations(completion: @escaping (Result<[Meep.LocationModel], Error>) -> Void) {
            
            switch scenario {
            case .data:
                completion(.success(LocationModel.contained))
            case .empty:
                completion(.success(LocationModel.empty))
            case .error:
                completion(.failure(RequestErrors.decode))
            }
        }
    }
}
