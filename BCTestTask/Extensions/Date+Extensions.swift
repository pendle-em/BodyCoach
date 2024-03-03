//
//  Date+Extensions.swift
//  BCTestTask
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import Foundation

extension Date {
    var dayNumber: Int {
        Calendar.current.component(.day, from: self)
    }
}
