//
//  LeftButton.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct LeftButton: View {
    var body: some View {
        ZStack {
            Image("Button_left")
                .resizable()
                .scaledToFill()
                .frame(width: 100, alignment: .center)
            
            VStack(alignment: .center) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(.white))
                    .frame(width: 23, alignment: .center)
                    .padding(.bottom, 40)
                    .padding(.trailing, 30)
                
            }
            .frame(alignment: .center)
        }
        .frame(width: 72, height: 53, alignment: .center)
    }
}

#Preview {
    LeftButton()
}
