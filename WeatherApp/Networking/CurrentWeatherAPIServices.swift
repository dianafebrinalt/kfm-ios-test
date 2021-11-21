//
//  CurrentWeatherAPIServices.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 20/11/21.
//

import UIKit
import Foundation

class CurrentWeatherAPIServices: NetworkingProtocol {
    
    func fetchDataCurrentLocationWeatherFromLonLong(lat: String, lon: String, completion: @escaping (CurrentWeatherModel) -> ()) {
        let apiKey = "dd03a9512ea492f0f87187cd95e26ceb"
        
        let API_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: API_URL) else {
            fatalError()
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                print("Response is Empty or Response not detect. Try it again!")
                return
            }
            print("HTTP Status : \(response)")
            
            guard let data = data else{
                print("There is no data, hikssss :((")
                return
            }
            
            do {
                let dataCurrentLocationWeather = try JSONDecoder().decode(CurrentWeatherModel.self, from: data)
                completion(dataCurrentLocationWeather)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func fetchDataCurrentWeatherBasedOnCity(city: String, completion: @escaping (CurrentWeatherModel) -> ()) {
        let formattedCity = city.replacingOccurrences(of: " ", with: "+")
        
        let apiKey = "dd03a9512ea492f0f87187cd95e26ceb"
        
        let API_URL = "http://api.openweathermap.org/data/2.5/weather?q=\(formattedCity)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: API_URL) else {
            fatalError()
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                print("Response is Empty or Response not detect. Try it again!")
                return
            }
            print("HTTP Status : \(response)")
            
            guard let data = data else{
                print("There is no data, hikssss :((")
                return
            }
            
            do {
                let dataCurrentLocationWeather = try JSONDecoder().decode(CurrentWeatherModel.self, from: data)
                completion(dataCurrentLocationWeather)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
