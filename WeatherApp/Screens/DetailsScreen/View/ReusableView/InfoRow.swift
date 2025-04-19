//
//  InfoRow.swift
//  WeatherApp
//
//  Created by Salma Atef on 19/04/2025.
//

import SwiftUI

struct InfoRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title.uppercased())
                .font(.detailsTitleSFProTextBold)
                .foregroundColor(.greyTextColor)
            Spacer()
            Text(value)
                .font(.titleSFProTextBold)
                .foregroundColor(.babyBlueTextColor)
        }
    }
}

#Preview {
    InfoRow(title: "", value: "")
}
