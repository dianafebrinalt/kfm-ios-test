//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 20/11/21.
//

import Foundation

public struct CurrentWeatherModel{
    let date: Date
    let location: String
    let temperature: String
    let descriptionWeather: String
    let icon: String
    
    init(data: APICurrentWeather) {
        date = data.dt
        location = data.name
        temperature = "\(data.temp)"
        descriptionWeather = data.weather.first?.main ?? ""
        icon = data.weather.first?.icon ?? ""
    }
}
