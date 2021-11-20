//
//  CurrentWeatherAPIServices.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 20/11/21.
//

import UIKit
import CoreLocation

public class CurrentWeatherAPIServices: NSObject {
    
    private let locationManager = CLLocationManager()
    private var completionHandler: ((CurrentWeatherModel) -> Void)?
    
    public override init() {
        super.init()
        locationManager.delegate = self
    }
    
    public func fetchCurrentWeatherData(_ completionHandler: @escaping((CurrentWeatherModel) -> Void)) {
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func requestCurrentWeatherDataFromApi(withLocation location: CLLocationCoordinate2D) {
        let API_KEY = "dd03a9512ea492f0f87187cd95e26ceb"
        
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(API_KEY)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
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
                let decoder = JSONDecoder()
                let jsonCurrentWeatherData = try decoder.decode(APICurrentWeather.self, from: data)
                
                DispatchQueue.main.async {
                    self.completionHandler?(CurrentWeatherModel(data: jsonCurrentWeatherData))
                    print(jsonCurrentWeatherData)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

extension CurrentWeatherAPIServices: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        requestCurrentWeatherDataFromApi(withLocation: location.coordinate)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("The error is \(error.localizedDescription)")
    }
}
