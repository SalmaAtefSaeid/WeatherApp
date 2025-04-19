//
//  LoadingOverlayView.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct LoadingOverlayView: View {
    var body: some View {
        VStack {
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle())
                .padding()
                .background(Color.black.opacity(0.5), in: RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    LoadingOverlayView()
}
