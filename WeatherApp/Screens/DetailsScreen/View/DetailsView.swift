//
//  DetailsView.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct DetailsView: View {
    
    let historicalWeatherInfo: WeatherInfo
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // Header with city name and dismiss button
                DetailsTitleHeaderView(action: {
                    dismiss()
                }, cityName: historicalWeatherInfo.city?.name ?? "N/A", countryAbb: historicalWeatherInfo.city?.countryAbb ?? "N/A")

                // Weather details
                WeatherInfoSectionView(historicalWeatherInfo: historicalWeatherInfo)
                .padding(.horizontal)

                Spacer()
                
                Text("weather information for \(historicalWeatherInfo.city?.name ?? "N/A") received on\n \(historicalWeatherInfo.date?.formattedString() ?? "N/A")".uppercased())
                    .multilineTextAlignment(.center)
                    .font(.footerTextSFProTextRegular)
                    .foregroundColor(.greyTextColor)
                    .padding(.bottom, 20)
            }
            .padding(.top)
        }
        .ignoresSafeArea()
        .background {
            BackgroundView()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailsView(historicalWeatherInfo: City.mock(context: DataController.shared.context).weatherInfoList.first!)
}
