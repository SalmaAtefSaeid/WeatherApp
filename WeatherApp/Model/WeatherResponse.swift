//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

struct WeatherResponse: Decodable, Identifiable, Hashable {
    
    let id: Int
    let coordinates: Coordinates
    let conditions: [WeatherCondition]
    let baseStation: String?
    let temperatureInfo: TemperatureInfo
    let visibility: Int?
    let wind: Wind?
    let cloudCoverage: Cloud?
    let timestamp: Int
    let systemInfo: SystemInfo
    let timezoneOffset: Int?
    let cityName: String
    let responseCode: Int

    enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case conditions = "weather"
        case baseStation = "base"
        case temperatureInfo = "main"
        case visibility
        case wind
        case cloudCoverage = "clouds"
        case timestamp = "dt"
        case systemInfo = "sys"
        case timezoneOffset = "timezone"
        case id = "id"
        case cityName = "name"
        case responseCode = "cod"
    }
}


extension WeatherResponse {
    static let mock: WeatherResponse = WeatherResponse(
        id: 360630,
        coordinates: Coordinates(longitude: 31.2, latitude: 30.0),
        conditions: [
            WeatherCondition(conditionID: 800, main: "Clear", description: "clear sky", icon: "01d")
        ],
        baseStation: "stations",
        temperatureInfo: TemperatureInfo(
            current: 27.3,
            feelsLike: 29.0,
            minimum: 25.0,
            maximum: 30.0,
            pressure: 1012,
            humidity: 45
        ),
        visibility: 10000,
        wind: Wind(speed: 3.5, directionDegrees: 160, gust: nil),
        cloudCoverage: Cloud(coveragePercent: 0),
        timestamp: Int(Date().timeIntervalSince1970),
        systemInfo: SystemInfo(
            systemType: 1,
            systemID: 1234,
            countryCode: "EG",
            sunriseTime: Int(Date().addingTimeInterval(-3600 * 6).timeIntervalSince1970),
            sunsetTime: Int(Date().addingTimeInterval(3600 * 6).timeIntervalSince1970)
        ),
        timezoneOffset: 7200,
        cityName: "Cairo",
        responseCode: 200
    )
}
