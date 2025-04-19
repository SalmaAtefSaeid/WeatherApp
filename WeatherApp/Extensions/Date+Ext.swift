//
//  Date+Ext.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import Foundation

extension Date {
    func formattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy - HH:mm"
        return formatter.string(from: self)
    }
}
