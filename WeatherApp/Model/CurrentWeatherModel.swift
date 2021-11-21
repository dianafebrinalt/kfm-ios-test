//
//  APICurrentWeather.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 20/11/21.
//

import Foundation
import UIKit

struct CurrentWeatherModel: Decodable {
    let name: String
    let dt: Int
    let main: Main
    let weather: [Weather]
    let sys: Sys
}

struct Weather: Decodable {
    let description: String
    let icon: String
}

struct Main: Decodable {
    let temp: Double
}

struct Sys: Decodable {
    let country: String
}
