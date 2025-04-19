//
//  ForwardButton.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct ForwardButton: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.right")
                .foregroundColor(.babyBlueTextColor)
                .font(.title3)
        }
    }
}

#Preview {
    ForwardButton()
}
