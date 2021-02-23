//
//  DateExtension.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import Foundation

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {

        return calendar.component(component, from: self)
    }
}

extension Int {
    func toDateString() -> String {
        let formatter = NumberFormatter()
        formatter.minimumIntegerDigits = 2
        
        let number = NSNumber(value: self)
        return formatter.string(from: number)!
    }
}


