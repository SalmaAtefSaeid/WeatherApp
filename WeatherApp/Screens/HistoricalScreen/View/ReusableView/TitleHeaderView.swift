//
//  TitleHeaderView.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct TitleHeaderView: View {
    
    let action: () -> Void
    let cityName: String
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text(cityName.uppercased())
                    .font(.subTitleSFProTextBold)
                
                Text("HISTORICAL")
                    .font(.subTitleSFProTextBold)
            }
            
            HStack {
                Button {
                    action()
                } label: {
                    LeftButton()
                }
                Spacer()
            }
            .padding(.leading, 10)
            .padding(.top, 35)
        }
        .frame(width: UIScreen.main.bounds.width, height: 53)
    }
}

#Preview {
    TitleHeaderView(action: {}, cityName: "london")
}
