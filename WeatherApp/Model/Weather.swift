//
//  Weather.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

import Foundation

struct WeatherCondition: Decodable, Hashable {
    let conditionID: Int
    let main: String
    let description: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case conditionID = "id"
        case main
        case description
        case icon
    }
}
