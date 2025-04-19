//
//  Wind.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

struct Wind: Decodable, Hashable {
    let speed: Double
    let directionDegrees: Int
    let gust: Double?

    enum CodingKeys: String, CodingKey {
        case speed
        case directionDegrees = "deg"
        case gust
    }
}
