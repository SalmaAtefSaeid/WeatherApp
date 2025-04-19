//
//  MockNetworkHandler.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import XCTest
@testable import WeatherApp

class MockNetworkHandler: NetworkHandling {
    var shouldReturnError = false
    var mockResponse: WeatherResponse?

    func fetchWeatherByCity(_ city: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Network error"])))
        } else if let response = mockResponse {
            completion(.success(response))
        }
    }
}
