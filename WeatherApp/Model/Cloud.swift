//
//  Cloud.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

struct Cloud: Decodable, Hashable {
    let coveragePercent: Int

    enum CodingKeys: String, CodingKey {
        case coveragePercent = "all"
    }
}
