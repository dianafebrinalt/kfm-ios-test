//
//  NetworkingProtocol.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 21/11/21.
//

import Foundation
import UIKit

protocol NetworkingProtocol {
    func getDataCurrentLocationWeatherFromLonLong(lat: String, lon: String, completion: @escaping (CurrentWeatherModel) -> ())
    func getDataCurrentWeatherBasedOnCity(city: String, completion: @escaping (CurrentWeatherModel) -> ())
}
