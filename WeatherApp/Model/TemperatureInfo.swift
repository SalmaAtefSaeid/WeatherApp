//
//  TemperatureInfo.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

struct TemperatureInfo: Decodable, Hashable {
    let current: Double
    let feelsLike: Double
    let minimum: Double
    let maximum: Double
    let pressure: Int
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case current = "temp"
        case feelsLike = "feels_like"
        case minimum = "temp_min"
        case maximum = "temp_max"
        case pressure
        case humidity
    }
    
    // Computed properties to convert Kelvin to Celsius
    var currentInCelsius: Double {
        return current - 273.15
    }
    
    var feelsLikeInCelsius: Double {
        return feelsLike - 273.15
    }
    
    var minimumInCelsius: Double {
        return minimum - 273.15
    }
    
    var maximumInCelsius: Double {
        return maximum - 273.15
    }
}
