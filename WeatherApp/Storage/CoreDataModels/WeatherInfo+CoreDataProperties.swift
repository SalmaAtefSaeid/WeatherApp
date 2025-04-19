//
//  WeatherInfo+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//
//

import Foundation
import CoreData


extension WeatherInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherInfo> {
        return NSFetchRequest<WeatherInfo>(entityName: "WeatherInfo")
    }

    @NSManaged public var date: Date?
    @NSManaged public var humidity: Int16
    @NSManaged public var temperature: Int16
    @NSManaged public var weatherDescription: String?
    @NSManaged public var windSpeed: Double
    @NSManaged public var city: City?
    @NSManaged public var iconId: String?

}

extension WeatherInfo : Identifiable {

}
