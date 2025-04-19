//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Salma Atef on 17/04/2025.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    
    @StateObject private var dataController = DataController.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
