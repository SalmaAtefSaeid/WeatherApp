//
//  RightButton.swift
//  WeatherApp
//
//  Created by Salma Atef on 18/04/2025.
//

import SwiftUI

struct RightButton: View {
    var body: some View {
        ZStack {
            Image("Button_right")
                .resizable()
                .scaledToFill()
                .frame(width: 100, alignment: .center)
            
            VStack(alignment: .center) {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(.white))
                    .frame(width: 23, alignment: .center)
                    .padding([.bottom, .leading], 35)
                
            }
            .frame(alignment: .center)
        }
        .frame(width: 72, height: 53, alignment: .center)
    }
}

#Preview {
    RightButton()
}
