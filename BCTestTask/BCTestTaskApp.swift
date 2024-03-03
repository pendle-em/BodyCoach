//
//  BCTestTaskApp.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 21/02/2024.
//

import SwiftUI

@main
struct BCTestTaskApp: App {
    let mainViewModel: MainViewModel
    
    init() {
        self.mainViewModel = MainViewModel()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: mainViewModel)
        }
    }
}
