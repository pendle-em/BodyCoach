//
//  HealthDataRepository.swift
//  BCTestTask
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import Foundation

protocol HealthDataRepository {
    func fetchData() async throws -> [StepsData]
}
