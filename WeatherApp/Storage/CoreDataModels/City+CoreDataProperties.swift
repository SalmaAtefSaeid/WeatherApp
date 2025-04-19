//
//  City+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//
//

import Foundation
import CoreData


extension City {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<City> {
        return NSFetchRequest<City>(entityName: "City")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var countryAbb: String?
    @NSManaged public var weatherInfos: NSSet?

}

// MARK: Generated accessors for weatherInfos
extension City {

    @objc(addWeatherInfosObject:)
    @NSManaged public func addToWeatherInfos(_ value: WeatherInfo)

    @objc(removeWeatherInfosObject:)
    @NSManaged public func removeFromWeatherInfos(_ value: WeatherInfo)

    @objc(addWeatherInfos:)
    @NSManaged public func addToWeatherInfos(_ values: NSSet)

    @objc(removeWeatherInfos:)
    @NSManaged public func removeFromWeatherInfos(_ values: NSSet)

}

extension City : Identifiable {

}

extension City {
    var weatherInfoList: [WeatherInfo] {
        (weatherInfos as? Set<WeatherInfo>)?
            .sorted(by: { ($0.date ?? Date()) > ($1.date ?? Date()) }) ?? []
    }
}

extension City {
    static func mock(context: NSManagedObjectContext) -> City {
        let city = City(context: context)
        city.id = UUID()
        city.name = "San Francisco"

        let weather = WeatherInfo(context: context)
        weather.date = Date()
        weather.temperature = 21
        weather.humidity = 65
        weather.windSpeed = 5.2
        weather.weatherDescription = "Partly Cloudy"

        city.addToWeatherInfos(weather)

        return city
    }
}
