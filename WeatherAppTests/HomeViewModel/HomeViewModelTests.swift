//
//  HomeViewModelTests.swift
//  WeatherAppTests
//
//  Created by Salma Atef on 19/04/2025.
//

import XCTest
import SwiftUI
@testable import WeatherApp

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockNetworkHandler: MockNetworkHandler!
    var mockWeatherDataController: MockWeatherDataController!
    
    override func setUp() {
        super.setUp()
        mockNetworkHandler = MockNetworkHandler()
        mockWeatherDataController = MockWeatherDataController()
        viewModel = HomeViewModel(
            networkHandler: mockNetworkHandler,
            weatherDataController: mockWeatherDataController
        )
    }
    
    override func tearDown() {
        viewModel = nil
        mockNetworkHandler = nil
        mockWeatherDataController = nil
        super.tearDown()
    }
    
    func testFetchWeatherSuccess() {
        let expectation = self.expectation(description: "Weather fetch should succeed")
        
        // Given
        let mockWeatherResponse = WeatherResponse.mock
        mockNetworkHandler.mockResponse = mockWeatherResponse
        mockNetworkHandler.shouldReturnError = false
        let city = City.mock(context: DataController.shared.context)
        
        // When
        viewModel.fetchWeather(for: city.name ?? "", countryAbbreviation: city.countryAbb ?? "")
        
        // Then (wait a moment for async update)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertEqual(self.viewModel.cities.count, 1)
            XCTAssertEqual(self.viewModel.cities.first?.name, city.name)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
    }
    
    func testFetchWeatherFailure() {
        let expectation = self.expectation(description: "Weather fetch should fail")
        
        // Given
        let cityName = "London"
        mockNetworkHandler.shouldReturnError = true
        
        // When
        viewModel.fetchWeather(for: cityName, countryAbbreviation: "GB")
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertNotNil(self.viewModel.alertItem)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
    }
    
    func testDeleteSavedCity() {
        // Given
        let mockCity = City.mock(context: DataController.shared.context)
        mockWeatherDataController.savedCities.append(mockCity)
        viewModel.fetchSavedCities()
        
        // When
        viewModel.deleteSavedCity(mockCity.name ?? "")
        
        // Then
        XCTAssertEqual(viewModel.cities.count, 0)
    }
    
    func testFetchSavedCities() {
        let expectation = self.expectation(description: "Weather fetch should success")
        
        // Given
        let mockCity = City.mock(context: DataController.shared.context)
        mockWeatherDataController.savedCities.append(mockCity)
        
        // When
        viewModel.fetchSavedCities()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // Then
            XCTAssertEqual(self.viewModel.cities.count, 1)
            XCTAssertEqual(self.viewModel.cities.first?.name, mockCity.name ?? "")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1)
    }
}
