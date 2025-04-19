//
//  SearchView.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBarView(searchText: $searchText)
                .padding([.top, .bottom], 16)
            ZStack {
                List(CountryProvider.allCountries().filter{$0.capital.lowercased().contains(searchText.lowercased()) || searchText == ""}) { country in
                    Text("\(country.capital), \(country.countryCode)")
                        .font(.cityNameTitleSFProTextBold)
                        .foregroundColor(.primary)
                        .onTapGesture {
                            viewModel.fetchWeather(for: country.capital, countryAbbreviation: country.countryCode)
                            dismiss()
                        }
                }
                .padding([.leading, .trailing], 20)
                .listRowSeparator(.hidden)
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    SearchView(viewModel: HomeViewModel())
}
