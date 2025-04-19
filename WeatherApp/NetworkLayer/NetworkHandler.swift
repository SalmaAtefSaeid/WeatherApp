//
//  NetworkHandler.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

import Foundation

protocol NetworkHandling {
    func fetchWeatherByCity(_ cityName: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void)
}

class NetworkHandler: NetworkHandling {
    
    func fetchWeatherByCity(_ cityName: String, completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        let parameters = [
            "q": cityName,
            "appid": NetworkConstants.apiKey
        ]
        
        let networkManager = NetworkManager()
        networkManager.executeAPICall(withURL: NetworkConstants.requestToGetWeather, httpMethod: "GET", parameters: parameters, header: nil) { [weak self] json in
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
                let weather = try JSONDecoder().decode(WeatherResponse.self, from: jsonData)
                completion(.success(weather))
            } catch {
                completion(.failure(error))
            }
        } failureHandler: { [weak self] error in
            completion(.failure(error))
        }
        
    }
}
