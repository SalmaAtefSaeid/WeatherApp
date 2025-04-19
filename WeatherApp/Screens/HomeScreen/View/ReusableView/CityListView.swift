//
//  CityListView.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct CityListView: View {
    
    let cities: [City]
    let deleteCity: (String) -> Void
    
    var body: some View {
        List {
            ForEach(cities) { city in
                NavigationLink(value: city) {
                    CityRowView(city: city)
                }
                .listRowInsets(EdgeInsets())
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(Color.clear)
            }
            .onDelete { indexSet in
                for index in indexSet {
                    let cityToDelete = cities[index]
                    deleteCity(cityToDelete.name ?? "N/A")
                }
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .padding()
    }
}

struct CityRowView: View {
    
    let city: City
    
    var body: some View {
        HStack {
            Text("\(city.name ?? ""), \(city.countryAbb ?? "")")
                .font(.cityNameTitleSFProTextBold)
                .foregroundColor(.primary)
            
            Spacer()
            
            ForwardButton()
        }
        .frame(height: 48)
        .padding([.leading])
    }
}

#Preview {
    CityListView(cities: [], deleteCity:{_ in })
}
