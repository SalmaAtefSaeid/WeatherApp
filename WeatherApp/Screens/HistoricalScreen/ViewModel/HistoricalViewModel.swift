//
//  HistoricalViewModel.swift
//  WeatherApp
//
//  Created by Salma Atef on 18/04/2025.
//


import Foundation

final class HistoricalViewModel: ObservableObject {
    
    @Published var city: City
    
    init(city: City) {
        self.city = city
    }
    
}
