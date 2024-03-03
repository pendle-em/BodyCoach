//
//  DefaultHealthDataRepository.swift
//  BCTestTask
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import Foundation
import HealthKit

final class DefaultHealthDataRepository: HealthDataRepository {
    private let healthStore: HKHealthStore
    private let currentDate: () -> Date
    
    init(currentDate: @escaping () -> Date = { Date() }) {
        self.healthStore = HKHealthStore()
        self.currentDate = currentDate
    }
    
    func fetchData() async throws -> [StepsData] {
        do {
            try await requestHealthKitPermission()
            return try await queryStepsData()
        } catch {
            throw error
        }
    }
}

extension DefaultHealthDataRepository {
    private func requestHealthKitPermission() async throws {
        guard HKHealthStore.isHealthDataAvailable() else {
            throw HealthDataRepositoryError.healthDataUnavailable
        }
        
        guard let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount) else {
            throw HealthDataRepositoryError.stepCountUnavailable
        }
        
        do {
            try await healthStore.requestAuthorization(toShare: [], read: [stepCountType])
        } catch {
            throw error
        }
    }
    
    private func queryStepsData() async throws -> [StepsData] {
        guard let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount) else {
            throw HealthDataRepositoryError.stepCountUnavailable
        }
                                                              
        guard let startOfWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: .now)),
              let endOfWeek = Calendar.current.date(byAdding: .day, value: 6, to: startOfWeek) else {
            throw HealthDataRepositoryError.setup
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: startOfWeek, end: endOfWeek, options: .strictStartDate)
        
        let query = HKStatisticsCollectionQuery(
            quantityType: stepCountType,
            quantitySamplePredicate: predicate,
            options: [.cumulativeSum],
            anchorDate: startOfWeek,
            intervalComponents: DateComponents(day: 1)
        )
        
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            query.initialResultsHandler = { _, results, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let results else {
                    continuation.resume(throwing: HealthDataRepositoryError.noStepCountData)
                    return
                }
                
                var stepsDataArray: [StepsData] = []
                results.enumerateStatistics(from: startOfWeek, to: endOfWeek) { statistics, _ in
                    let count = statistics.sumQuantity()?.doubleValue(for: HKUnit.count()) ?? 0
                    let date = statistics.startDate
                    let steps = StepsData(date: date, count: Int(count))
                    stepsDataArray.append(steps)
                }
                continuation.resume(returning: stepsDataArray)
            }
            
            self?.healthStore.execute(query)
        }
    }
}
