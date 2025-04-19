//
//  BackgroundView.swift
//  WeatherApp
//
//  Created by Salma Atef on 18/04/2025.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            // Gradient background behind the image
            LinearGradient(
                colors: [.white, .backgroundColor],
                startPoint: .top,
                endPoint: .bottom
            )
            
            // Bottom-aligned image
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, alignment: .bottom)
        }
        .ignoresSafeArea()
    }
}


#Preview {
    BackgroundView()
}
