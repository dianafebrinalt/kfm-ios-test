//
//  APICurrentWeather.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 20/11/21.
//

import Foundation

struct APICurrentWeather: Decodable {
    let name: String
    let temp: Double
    let dt: Date
    let weather: [Weather]
}

struct Weather: Decodable {
    let main: String
    let icon: String
}
