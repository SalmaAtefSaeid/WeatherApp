//
//  Coordinates.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

struct Coordinates: Decodable, Hashable {
    let longitude: Double
    let latitude: Double

    enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
