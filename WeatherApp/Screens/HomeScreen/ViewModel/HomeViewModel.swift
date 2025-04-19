//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published var cities: [City] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    
    private let networkHandler: NetworkHandling
    private let weatherDataController: WeatherDataControlling
    
    init(networkHandler: NetworkHandling = NetworkHandler(), weatherDataController: WeatherDataControlling = WeatherDataController()) {
        self.networkHandler = networkHandler
        self.weatherDataController = weatherDataController
        fetchSavedCities()
    }
    
    // Fetch weather and handle response
    func fetchWeather(for city: String, countryAbbreviation: String) {
        isLoading = true
        alertItem = nil
        
        networkHandler.fetchWeatherByCity(city) { result in
            
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                
                self.isLoading = false // Stop the loading spinner
                
                switch result {
                case .success(let response):
                    self.saveCity(response, countryAbbreviation: countryAbbreviation) { saveResult in
                        switch saveResult {
                        case .success:
                            self.fetchSavedCities() // Refresh the cities list
                        case .failure(let error):
                            self.alertItem = AlertContext.unableToExecuteCoreDataOperation
                        }
                    }
                case .failure(let error):
                    self.alertItem = AlertContext.invalidResponse
                }
            }
        }
    }
    
    // Save city weather data
    func saveCity(_ weather: WeatherResponse, countryAbbreviation: String, completion: @escaping (Result<Void, Error>) -> Void) {
        weatherDataController.saveWeather(for: weather.cityName, country: countryAbbreviation, from: weather) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // Fetch all saved cities
    func fetchSavedCities() {
        isLoading = true
        alertItem = nil
        
        let result = weatherDataController.fetchSavedCities()
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            switch result {
            case .success(let cities):
                self.cities = cities
            case .failure(let error):
                self.alertItem = AlertContext.unableToExecuteCoreDataOperation
            }
            
            self.isLoading = false
        }
    }

    
    // Delete a city
    func deleteSavedCity(_ city: String) {
        // Fetch saved cities and handle the result
        let result = weatherDataController.fetchSavedCities()
        
        switch result {
        case .success(let cities):
            // Find the city to delete
            guard let cityToDelete = cities.first(where: { $0.name == city }) else {
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.alertItem = AlertContext.unableToExecuteCoreDataOperation
                }
                return
            }
            
            // Proceed with deleting the city
            weatherDataController.deleteCity(cityToDelete) { result in
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    switch result {
                    case .success:
                        self.fetchSavedCities() // Refresh after deletion
                    case .failure(let error):
                        self.alertItem = AlertContext.unableToExecuteCoreDataOperation
                    }
                }
            }
            
        case .failure(let error):
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.alertItem = AlertContext.unableToExecuteCoreDataOperation
            }
        }
    }

}

