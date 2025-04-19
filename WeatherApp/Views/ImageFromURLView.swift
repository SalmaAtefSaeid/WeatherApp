//
//  ImageFromURLView.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct ImageFromURLView: View {
    
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()  // Show loading indicator when image is loading
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100) 
            case .failure:
                Image(systemName: "exclamationmark.triangle.fill")  // Show error icon if loading fails
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    ImageFromURLView(imageURL: "")
}
