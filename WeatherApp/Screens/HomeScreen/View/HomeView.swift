//
//  HomeView.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    CitiesHeaderView(action: {
                        isSheetPresented = true
                    })
                    
                    CityListView(cities: viewModel.cities, deleteCity: viewModel.deleteSavedCity)
                }
                
                if viewModel.isLoading {
                    LoadingOverlayView()
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                SearchView(viewModel: viewModel)
            }
            .navigationDestination(for: City.self) { city in
                HistoricalView(viewModel: HistoricalViewModel(city: city))
            }
            .background {
                BackgroundView()
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    HomeView()
}
