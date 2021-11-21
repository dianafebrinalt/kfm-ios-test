//
//  ViewController.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 18/11/21.
//

import UIKit
import CoreLocation

class MainPageViewController: UIViewController, UISearchBarDelegate {
    
    var searchLocation = UISearchController()

    let currentWeatherAPIServices = CurrentWeatherAPIServices()
    
    var locationManager = CLLocationManager()
    var currentLoc: CLLocation?
    var latitude: CLLocationDegrees!
    var longitude: CLLocationDegrees!

    private let holderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var currentDateLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var currentLocationLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var currentTempLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 60.0, weight: .heavy)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var currentDescWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = " "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 35.0, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var imageWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cloud.fill")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Weather App"
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 36/255, green: 36/255, blue: 36/255, alpha: 100/100),
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 38, weight: .heavy)]
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchLocation
        searchLocation.searchBar.delegate = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        setupUI()
        loadDataBasedOnCity(city: "Pematangsiantar")
    }
    
    private func setupUI() {
        view.addSubview(holderView)
        holderView.addSubview(currentDateLabel)
        holderView.addSubview(currentLocationLabel)
        holderView.addSubview(currentTempLabel)
        holderView.addSubview(imageWeather)
        holderView.addSubview(currentDescWeatherLabel)
        
        NSLayoutConstraint.activate([
            holderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            holderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            holderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            holderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            currentDateLabel.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 20),
            currentDateLabel.leftAnchor.constraint(equalTo: holderView.leftAnchor, constant: 16),
            
            currentLocationLabel.topAnchor.constraint(equalTo: currentDateLabel.bottomAnchor, constant: 20),
            currentLocationLabel.leftAnchor.constraint(equalTo: holderView.leftAnchor, constant: 16),
            
            currentTempLabel.topAnchor.constraint(equalTo: currentLocationLabel.bottomAnchor, constant: 20),
            currentTempLabel.leftAnchor.constraint(equalTo: holderView.leftAnchor, constant: 16),
            
            imageWeather.centerYAnchor.constraint(equalTo: holderView.centerYAnchor),
            imageWeather.leftAnchor.constraint(equalTo: holderView.leftAnchor, constant: 16),
            imageWeather.rightAnchor.constraint(equalTo: holderView.rightAnchor, constant: -16),
            imageWeather.heightAnchor.constraint(equalToConstant: 200.0),
            
            currentDescWeatherLabel.topAnchor.constraint(equalTo: imageWeather.bottomAnchor, constant: 16),
            currentDescWeatherLabel.leftAnchor.constraint(equalTo: imageWeather.leftAnchor, constant: 16),
            currentDescWeatherLabel.rightAnchor.constraint(equalTo: imageWeather.rightAnchor, constant: -16)
        ])
    }
    
    func loadDataBasedOnLatandLong(lat: String, long: String) {
        currentWeatherAPIServices.getDataCurrentLocationWeatherFromLonLong(lat: lat, lon: long) { (currentWeather) in
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, dd MMM yyyy"
            let stringDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(currentWeather.dt)))
            
            DispatchQueue.main.async { [self] in
                self.currentDateLabel.text = stringDate
                self.currentLocationLabel.text = "\(currentWeather.name ?? "") , \(currentWeather.sys.country ?? "")"
                self.currentTempLabel.text = "\(currentWeather.main.temp)"
                self.imageWeather.loadImageFromURL(url: "http://openweathermap.org/img/wn/\(currentWeather.weather[0].icon)@2x.png")
                self.currentDescWeatherLabel.text = currentWeather.weather[0].description.capitalized
            }
        }
    }
    
    func loadDataBasedOnCity(city: String) {
        currentWeatherAPIServices.getDataCurrentWeatherBasedOnCity(city: city) { (currentWeather) in
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, dd MMM yyyy"
            let stringDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(currentWeather.dt)))
            
            DispatchQueue.main.async { [self] in
                self.currentDateLabel.text = stringDate
                self.currentLocationLabel.text = "\(currentWeather.name ?? "") , \(currentWeather.sys.country ?? "")"
                self.currentTempLabel.text = "\(currentWeather.main.temp)"
                self.imageWeather.loadImageFromURL(url: "http://openweathermap.org/img/wn/\(currentWeather.weather[0].icon)@2x.png")
                self.currentDescWeatherLabel.text = currentWeather.weather[0].description.capitalized
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let locationString = searchBar.text, !locationString.isEmpty {
            loadDataBasedOnCity(city: locationString)
        }
    }
}

extension MainPageViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        manager.delegate = nil
        
        let location = locations[0].coordinate
        latitude = location.latitude
        longitude = location.longitude
        print("Lat ", latitude.description)
        print("Long ", longitude.description)
        loadDataBasedOnLatandLong(lat: latitude.description, long: longitude.description)
    }
}

extension UIFont {
    public class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont

        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}
