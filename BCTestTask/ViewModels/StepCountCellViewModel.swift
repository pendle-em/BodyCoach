//
//  StepCountCellViewModel.swift
//  BCTestTask
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import Foundation

struct StepCountCellViewModel: Identifiable {
    let id = UUID()
    let day: Int
    let steps: String
    
    init(date: Date, steps: Int) { // TODO
        self.day = 15
        self.steps = "12,342"
    }
}
