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
    
    func fetchStepsData() {
        let stepsData = [
            StepsData(date: .now, count: 1631),
            StepsData(date: .now, count: 24237),
            StepsData(date: .now, count: 1234),
            StepsData(date: .now, count: 0),
            StepsData(date: .now, count: 5697),
            StepsData(date: .now, count: 10231),
            StepsData(date: .now, count: 490)
        ]
        
        updateCellViewModels(with: stepsData)
        description = "This weeks data"
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

struct StepsData { // TODO: move
    let date: Date
    let count: Int
}
