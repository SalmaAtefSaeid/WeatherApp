//
//  WeatherInfoSectionView.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct WeatherInfoSectionView: View {
    let historicalWeatherInfo: WeatherInfo

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            ImageFromURLView(imageURL: "https://openweathermap.org/img/w/\(historicalWeatherInfo.iconId ?? "").png")
                .padding()
            InfoRow(title: "Description", value: historicalWeatherInfo.weatherDescription ?? "N/A")
            InfoRow(title: "Temperature", value: "\(historicalWeatherInfo.temperature)°C")
            InfoRow(title: "Humidity", value: "\(historicalWeatherInfo.humidity)%")
            InfoRow(title: "Wind Speed", value: "\(historicalWeatherInfo.windSpeed) km/h")
        }
        .frame(width: 276, height: 347)
        .padding(30)
        .background {
            Color.white
                .cornerRadius(45)
                .shadow(color: .black.opacity(0.1), radius: 12, x: 0, y: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 45)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
        }
    }
}

#Preview {
    WeatherInfoSectionView(historicalWeatherInfo: City.mock(context: DataController.shared.context).weatherInfoList.first!)
}
