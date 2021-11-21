//
//  ViewController.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 18/11/21.
//

import UIKit
import CoreLocation
import SDWebImage

class MainPageViewController: UIViewController {
    
    var searchController =  UISearchController()

    private let holderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var currentDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Minggu, 21 November 2021"
        label.textColor = .black
        label.font = UIFont.rounded(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var currentLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Medan"
        label.textColor = .black
        label.font = UIFont.rounded(ofSize: 30.0, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var currentTempLabel: UILabel = {
        let label = UILabel()
        label.text = "60˚C"
        label.textColor = .black
        label.font = UIFont.rounded(ofSize: 60.0, weight: .heavy)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var currentDescWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.textColor = .black
        label.font = UIFont.rounded(ofSize: 35.0, weight: .semibold)
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
            NSAttributedString.Key.font: UIFont.rounded(ofSize: 40, weight: .heavy)]
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController
        
        setupUI()
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
