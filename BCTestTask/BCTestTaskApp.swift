//
//  BCTestTaskApp.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 21/02/2024.
//

import SwiftUI

@main
struct BCTestTaskApp: App {
    let healthDataRepository: HealthDataRepository
    let mainViewModel: MainViewModel
    
    init() {
        self.healthDataRepository = DefaultHealthDataRepository()
        self.mainViewModel = MainViewModel(repository: healthDataRepository)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: mainViewModel)
        }
    }
}
