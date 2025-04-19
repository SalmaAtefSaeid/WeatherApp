//
//  HistoricalWeatherRow.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct HistoricalWeatherRow: View {
    let weatherInfo: WeatherInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(weatherInfo.date?.formattedString() ?? "")
                .font(.detailsTitleSFProTextBold)
                .foregroundColor(.greyTextColor)

            Text("\(weatherInfo.weatherDescription?.capitalized ?? ""), \(weatherInfo.temperature)°C")
                .font(.subTitleSFProTextBold)
                .foregroundColor(.babyBlueTextColor)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    HistoricalWeatherRow(weatherInfo: City.mock(context: DataController.shared.context).weatherInfoList.first!)
}
