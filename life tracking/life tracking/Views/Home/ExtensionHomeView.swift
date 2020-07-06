//
//  ExtensionHomeView.swift
//  life tracking
//
//  Created by Rodrigo Santos on 06/07/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import SwiftUI

private let LASTDAYS = 6

extension HomeView {
    internal var startDateOfMonth: String {
        let components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        let startOfMonth = Calendar.current.date(from: components)!
        return format(date: startOfMonth)
    }

    internal var endDateOfMonth: String {
        var components = Calendar.current.dateComponents([.year, .month], from: currentDate)
        components.month = (components.month ?? 0) + 1
        components.hour = (components.hour ?? 0) - 1
        let endOfMonth = Calendar.current.date(from: components)!
        return format(date: endOfMonth)
    }
    
    internal var lastDays: [LastDays] {
        
        var lastDays: [LastDays] = []
        let firstDay: LastDays = LastDays(id: UUID(), date: currentDate)
        lastDays.append(firstDay)
        for index in 1...LASTDAYS {
            let lastDay: LastDays = LastDays(id: UUID(), date: Calendar.current.date(byAdding: .day, value: -index, to: currentDate) ?? currentDate)
            lastDays.append(lastDay)
        }
        
        return lastDays
    }
    
    internal func format(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: date)
    }
    
    internal func formatForDay(date: Date) -> String {
        let components = Calendar.current.dateComponents([.day], from: date)
        let day = components.day!
        return String(day)
    }
    
    internal func formatForWeek(date: Date) -> String {
        let components = Calendar.current.dateComponents([.weekday], from: date)
        let week = components.weekday!
        
        let formatter = DateFormatter()
        let weekName = formatter.shortWeekdaySymbols[week - 1]
        
        return weekName
    }
}
