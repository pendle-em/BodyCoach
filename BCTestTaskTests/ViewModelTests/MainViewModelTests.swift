//
//  MainViewModelTests.swift
//  BCTestTaskTests
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import XCTest
@testable import BCTestTask

class MainViewModelTests: XCTestCase {
    
    func testFetchDataSuccess() async throws {
        let repository = MockHealthDataRepository()
        let viewModel = MainViewModel(repository: repository)
        let expectedSteps = StepsData.mock
        
        try await viewModel.fetchStepsData()
        
        XCTAssertEqual(viewModel.title, "The Body Coach\nTest Task")
        XCTAssertEqual(viewModel.buttonTitle, "Load Data")
        XCTAssertEqual(viewModel.description, "This weeks data")
        XCTAssertEqual(viewModel.errorMessage, "")
        XCTAssertEqual(viewModel.cellViewModels.count, expectedSteps.count)
        XCTAssertEqual(viewModel.cellViewModels.first?.day, Calendar.current.component(.day, from: expectedSteps.first!.date))
        XCTAssertEqual(viewModel.cellViewModels.first?.steps, expectedSteps.first?.count.formatted())
        XCTAssertEqual(viewModel.showAlert, false)
    }

    func testFetchDataError() async throws {
        let repository = MockHealthDataRepositoryError()
        let viewModel = MainViewModel(repository: repository)
        
        try await viewModel.fetchStepsData()
        
        XCTAssertEqual(viewModel.title, "The Body Coach\nTest Task")
        XCTAssertEqual(viewModel.buttonTitle, "Load Data")
        XCTAssertEqual(viewModel.description, "No data yet!")
        XCTAssertEqual(viewModel.errorMessage, "Health data unavailable")
        XCTAssertEqual(viewModel.cellViewModels.count, 0)
        XCTAssertEqual(viewModel.showAlert, true)
    }
}

// TODO: Add more tests for different errors
// TODO: Add tests for helper extensions
