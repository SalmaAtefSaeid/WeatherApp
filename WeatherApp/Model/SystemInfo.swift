//
//  SystemInfo.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

struct SystemInfo: Decodable, Hashable {
    let systemType: Int?
    let systemID: Int?
    let countryCode: String
    let sunriseTime: Int
    let sunsetTime: Int

    enum CodingKeys: String, CodingKey {
        case systemType = "type"
        case systemID = "id"
        case countryCode = "country"
        case sunriseTime = "sunrise"
        case sunsetTime = "sunset"
    }
}
