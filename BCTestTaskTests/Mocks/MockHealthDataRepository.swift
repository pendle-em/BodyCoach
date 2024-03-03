//
//  MockHealthDataRepository.swift
//  BCTestTaskTests
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import Foundation

final class MockHealthDataRepository: HealthDataRepository {
    func fetchData() async throws -> [StepsData] {
        StepsData.mock
    }
}

final class MockHealthDataRepositoryError: HealthDataRepository {
    func fetchData() async throws -> [StepsData] {
        throw HealthDataRepositoryError.healthDataUnavailable
    }
}
