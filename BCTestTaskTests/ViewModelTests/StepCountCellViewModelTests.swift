//
//  StepCountCellViewModelTests.swift
//  BCTestTaskTests
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import XCTest
@testable import BCTestTask

class StepCountCellViewModelTests: XCTestCase {
    
    func testInitialiser() {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: 2023, month: 9, day: 13)
        let testDate = calendar.date(from: dateComponents)!
        let testSteps = 12345
        
        let viewModel = StepCountCellViewModel(date: testDate, steps: testSteps)
        
        XCTAssertEqual(viewModel.day, 13)
        XCTAssertEqual(viewModel.steps, "12,345")
    }
}
