//
//  WeatherDataController.swift
//  WeatherApp
//
//  Created by Salma Atef on 18/04/2025.
//

import CoreData

final class WeatherDataController {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = DataController.shared.context) {
        self.context = context
    }

    // MARK: - Save City & Weather
    func saveWeather(for cityName: String, country: String?, from response: WeatherResponse, completion: @escaping (Result<Void, Error>) -> Void) {
        let context = DataController.shared.container.viewContext

        // Create new WeatherInfo
        let weather = WeatherInfo(context: context)
        weather.temperature = Int16(response.temperatureInfo.currentInCelsius)
        weather.humidity = Int16(response.temperatureInfo.humidity)
        weather.weatherDescription = response.conditions.first?.description ?? "N/A"
        weather.windSpeed = response.wind?.speed ?? 0
        weather.date = Date(timeIntervalSince1970: TimeInterval(response.timestamp))
        weather.iconId = response.conditions.first?.icon

        // Fetch or create city
        let result = WeatherDataController().fetchSavedCities()
        
        var city: City?
        
        switch result {
        case .success(let cities):
            // Search for a city with the specified name
            city = cities.first(where: { $0.name == cityName })
        case .failure(let error):
            // Handle the error
            print("Failed to fetch cities: \(error)")
        }

        if city == nil {
            city = City(context: context)
            city?.id = UUID()
            city?.name = cityName
            city?.countryAbb = country ?? ""
        }

        // Link the weather to the city
        if let city = city {
            weather.city = city              // Set the inverse relationship
            city.addToWeatherInfos(weather)  // Add weather to city's set
        }

        // Save context and handle success/failure
        do {
            try DataController.shared.saveContext()
            completion(.success(())) // Success case
        } catch {
            completion(.failure(error)) // Failure case
        }
    }

    // MARK: - Fetch Cities
    func fetchSavedCities() -> Result<[City], Error> {
        let request: NSFetchRequest<City> = City.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \City.name, ascending: true)]
        
        do {
            let cities = try context.fetch(request)
            return .success(cities) // Return success with the fetched cities
        } catch {
            return .failure(error) // Return failure with the error
        }
    }

    // MARK: - Delete City (and cascade weather)
    func deleteCity(_ city: City, completion: @escaping (Result<Void, Error>) -> Void) {
        context.delete(city)
        do {
            try DataController.shared.saveContext()
            completion(.success(())) // Success case
        } catch {
            completion(.failure(error)) // Failure case
        }
    }
}
