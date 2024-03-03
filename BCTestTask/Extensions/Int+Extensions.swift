//
//  Int+Extensions.swift
//  BCTestTask
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import Foundation

extension Int {
    var formattedWithCommas: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
