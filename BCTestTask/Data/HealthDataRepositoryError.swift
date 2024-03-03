//
//  HealthDataRepositoryError.swift
//  BCTestTask
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import Foundation

enum HealthDataRepositoryError: Error {
    case healthDataUnavailable
    case noStepCountData
    case setup
    case stepCountUnavailable
}
