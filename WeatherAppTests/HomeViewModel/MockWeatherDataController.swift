//
//  MockWeatherDataController.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import XCTest
@testable import WeatherApp

class MockWeatherDataController: WeatherDataControlling {
    
    var savedCities: [City] = []
    
    func fetchSavedCities() -> Result<[City], Error> {
        .success(savedCities)
    }
    
    func saveWeather(for cityName: String, country: String?, from response: WeatherResponse, completion: @escaping (Result<Void, Error>) -> Void) {
        let city = City.mock(context: DataController.shared.context)
        savedCities.append(city)
        completion(.success(()))
    }
    
    func deleteCity(_ city: City, completion: @escaping (Result<Void, Error>) -> Void) {
        if let index = savedCities.firstIndex(where: { $0.name == city.name }) {
            savedCities.remove(at: index)
            completion(.success(()))
        } else {
            completion(.failure(NSError(domain: "Mock", code: 1, userInfo: [NSLocalizedDescriptionKey: "City not found."])))
        }
    }
}
