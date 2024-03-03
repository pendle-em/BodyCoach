//
//  StepsData+Mock.swift
//  BCTestTaskTests
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import Foundation

extension StepsData {
    static var mock: [StepsData] {
        [
            StepsData(date: .now, count: 1631),
            StepsData(date: .now, count: 24237),
            StepsData(date: .now, count: 1234),
            StepsData(date: .now, count: 0),
            StepsData(date: .now, count: 5697),
            StepsData(date: .now, count: 10231),
            StepsData(date: .now, count: 490)
        ]
    }
}
