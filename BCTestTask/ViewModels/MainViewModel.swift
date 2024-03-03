//
//  MainViewModel.swift
//  BCTestTask
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import Foundation

import Foundation

final class MainViewModel: ObservableObject {
    let title: String = "The Body Coach\nTest Task"
    let buttonTitle: String = "Load Data"
    
    @Published var cellViewModels: [StepCountCellViewModel] = []
    @Published var description: String = "No data yet!"
    @Published var errorMessage: String = ""
    @Published var showAlert = false
    @Published var isLoading = false
    
    private let repository: HealthDataRepository
    
    init(repository: HealthDataRepository) {
        self.repository = repository
    }
    
    @MainActor
    func fetchStepsData() async throws {
        defer {
            isLoading = false
        }
        
        do {
            description = "Fetching..."
            isLoading = true
            
            let stepsData = try await repository.fetchData()
            updateCellViewModels(with: stepsData)
            description = "This weeks data"
        } catch {
            description = "No data yet!"
            handleError(error)
        }
    }
}

extension MainViewModel {
    private func updateCellViewModels(with model: [StepsData]) {
        cellViewModels = model.map { item in
            StepCountCellViewModel(
                date: item.date,
                steps: item.count
            )
        }
    }
    
    private func handleError(_ error: Error) {
        if let error = error as? HealthDataRepositoryError {
            switch error {
            case .healthDataUnavailable:
                errorMessage = "Health data unavailable"
            case .noStepCountData:
                errorMessage = "No step count data"
            case .setup:
                errorMessage = "Sorry, something went wrong"
            case .stepCountUnavailable:
                errorMessage = "Step count data unavailable"
            }
        } else {
            errorMessage = "Sorry, something went wrong"
        }
        showAlert = true
    }
}
