//
//  WeatherSearch.swift
//  TestOpenWeather
//
//  Created by Александр on 26.03.2022.
//




import Foundation


struct WeatherSearch: Codable {
    let weather: [WeatherCity]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}

struct WeatherCity: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}



struct Temp: Codable {
    let temp: Double
    
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
}
