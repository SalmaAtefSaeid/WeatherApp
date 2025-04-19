//
//  Country.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import Foundation

struct Country: Identifiable, Codable, Hashable {
    
    var id = UUID()           // Unique identifier
    let countryCode: String   // ISO country code (same as code)
    let name: String          // Country name
    let capital: String       // Capital city

    enum CodingKeys: String, CodingKey {
        case countryCode = "abbreviation"
        case name = "country"
        case capital = "city"
    }
}

class CountryProvider {
    static func allCountries() -> [Country] {
        guard let url = Bundle.main.url(forResource: "Countries", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let countries = try? JSONDecoder().decode([Country].self, from: data)
        else {
            print("Failed to load countries.json")
            return []
        }

        return countries.sorted { $0.name < $1.name }
    }
}
