//
//  CitiesHeaderView.swift
//  WeatherApp
//
//  Created by Salma Atef on 18/04/2025.
//

import SwiftUI

struct CitiesHeaderView: View {
    
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Text("CITIES")
                .font(.subTitleSFProTextBold)
            
            HStack {
                Spacer()
                Button {
                    action()
                } label: {
                    RightButton()
                }
            }
            .padding(.trailing, 5)
            .padding(.top, 35)
        }
        .frame(width: UIScreen.main.bounds.width, height: 53)
    }
}


#Preview {
    CitiesHeaderView(action: {})
}
