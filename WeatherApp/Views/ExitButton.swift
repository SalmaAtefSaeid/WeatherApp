//
//  ExitButton.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct ExitButton: View {
    var body: some View {
        ZStack {
            Image("Button_modal")
                .resizable()
                .scaledToFill()
                .frame(width: 100, alignment: .center)
            
            VStack(alignment: .center) {
                Image(systemName: "multiply")
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
    ExitButton()
}
