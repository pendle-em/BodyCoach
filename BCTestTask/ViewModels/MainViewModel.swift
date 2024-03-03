//
//  MainViewModel.swift
//  BCTestTask
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    let title: String = "The Body Coach\nTest Task"
    let buttonTitle: String = "Load Data"
    
    @Published var cellViewModels: [StepCountCellViewModel] = []
    @Published var description: String = "No data yet!"
    
    private let repository: HealthDataRepository
    
    init(repository: HealthDataRepository) {
        self.repository = repository
    }
    
    @MainActor
    func fetchStepsData() async throws {
        do {
            description = "Fetching..."
            
            let stepsData = try await repository.fetchData()
            updateCellViewModels(with: stepsData)
            description = "This weeks data"
        } catch {
            description = "No data yet!"
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
}
