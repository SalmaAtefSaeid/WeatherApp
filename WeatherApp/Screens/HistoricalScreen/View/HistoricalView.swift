//
//  HistoricalView.swift
//  WeatherApp
//
//  Created by Salma Atef on 18/04/2025.
//

import SwiftUI

struct HistoricalView: View {
    
    @ObservedObject var viewModel: HistoricalViewModel
    @State private var isSheetPresented = false
    @State private var selectedWeatherInfo: WeatherInfo?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            VStack {
                TitleHeaderView(action: {
                    dismiss()
                }, cityName: viewModel.city.name ?? "")
                
                List {
                    ForEach(viewModel.city.weatherInfoList) { weatherInfo in
                        Button(action: {
                            selectedWeatherInfo = weatherInfo
                            isSheetPresented = true
                        }) {
                            HistoricalWeatherRow(weatherInfo: weatherInfo)
                        }
                        .buttonStyle(.plain)
                    }
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .padding(.horizontal)
            }
        }
        .sheet(item: $selectedWeatherInfo) { info in
            DetailsView(historicalWeatherInfo: info)
        }
        .background {
            BackgroundView()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HistoricalView(viewModel: HistoricalViewModel(city: City.mock(context: DataController.shared.context)))
}
