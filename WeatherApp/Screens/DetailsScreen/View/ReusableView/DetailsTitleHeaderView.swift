//
//  DetailsTitleHeaderView.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct DetailsTitleHeaderView: View {
    
    let action: () -> Void
    let cityName: String
    let countryAbb: String
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text("\(cityName.uppercased()) \(countryAbb.uppercased())")
                    .font(.subTitleSFProTextBold)
                Spacer()
            }
            
            HStack {
                Button {
                    action()
                } label: {
                    ExitButton()
                }
                Spacer()
            }
            .padding(.leading, 10)
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width, height: 53)
    }
}

#Preview {
    DetailsTitleHeaderView(action: {}, cityName: "london", countryAbb: "UK")
}
