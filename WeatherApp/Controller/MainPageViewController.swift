//
//  ViewController.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 18/11/21.
//

import UIKit

class MainPageViewController: UIViewController {
    
    var searchController =  UISearchController()
    
    private let holderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let viewShowWeather: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 100/255, green: 146/255, blue: 210/255, alpha: 100/100)
        view.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 50/100).cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 8
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 5
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var currentDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Rabu, 17 November 2021"
        label.textColor = .white
        label.font = UIFont.rounded(ofSize: 13, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var currentLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Medan"
        label.textColor = .white
        label.font = UIFont.rounded(ofSize: 25.0, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var currentWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = "60˚C"
        label.textColor = .white
        label.font = UIFont.rounded(ofSize: 40.0, weight: .heavy)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var currentDescWeatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunny"
        label.textColor = .white
        label.font = UIFont.rounded(ofSize: 15.0, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var imageWeather: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.max.fill")
        imageView.tintColor = .yellow
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let hourlyLabel: UILabel = {
        let label = UILabel()
        label.text = "Hourly"
        label.textAlignment = .left
        label.font = UIFont.rounded(ofSize: 20.0, weight: .bold)
        label.textColor = UIColor(red: 65/255, green: 65/255, blue: 65/255, alpha: 100/100)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let next7DaysLabel: UILabel = {
        let label = UILabel()
        label.text = "Next 7 Days"
        label.textAlignment = .left
        label.font = UIFont.rounded(ofSize: 20.0, weight: .bold)
        label.textColor = UIColor(red: 65/255, green: 65/255, blue: 65/255, alpha: 100/100)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let holderViewForCollectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(red: 100/255, green: 146/255, blue: 210/255, alpha: 100/100).cgColor
        view.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 50/100).cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var hourlyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 8
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private lazy var next7DaysTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
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
        holderView.addSubview(viewShowWeather)
        viewShowWeather.addSubview(currentDateLabel)
        viewShowWeather.addSubview(currentLocationLabel)
        viewShowWeather.addSubview(currentWeatherLabel)
        viewShowWeather.addSubview(imageWeather)
        viewShowWeather.addSubview(currentDescWeatherLabel)
        holderView.addSubview(hourlyLabel)
        holderView.addSubview(holderViewForCollectionView)
        holderViewForCollectionView.addSubview(hourlyCollectionView)
        holderView.addSubview(next7DaysLabel)
        holderView.addSubview(next7DaysTableView)
        
        NSLayoutConstraint.activate([
            holderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            holderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            holderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            holderView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            viewShowWeather.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 10),
            viewShowWeather.rightAnchor.constraint(equalTo: holderView.rightAnchor, constant: -16),
            viewShowWeather.leftAnchor.constraint(equalTo: holderView.leftAnchor, constant: 16),
            viewShowWeather.heightAnchor.constraint(equalToConstant: 145.0),
            
            currentDateLabel.topAnchor.constraint(equalTo: viewShowWeather.topAnchor, constant: 10),
            currentDateLabel.leftAnchor.constraint(equalTo: viewShowWeather.leftAnchor, constant: 10),
            
            currentLocationLabel.topAnchor.constraint(equalTo: currentDateLabel.bottomAnchor, constant: 5),
            currentLocationLabel.leftAnchor.constraint(equalTo: viewShowWeather.leftAnchor, constant: 10),
            
            currentWeatherLabel.topAnchor.constraint(equalTo: currentLocationLabel.bottomAnchor, constant: 10),
            currentWeatherLabel.leftAnchor.constraint(equalTo: viewShowWeather.leftAnchor, constant: 10),
            
            imageWeather.topAnchor.constraint(equalTo: viewShowWeather.topAnchor, constant: 10),
            imageWeather.rightAnchor.constraint(equalTo: viewShowWeather.rightAnchor, constant: -16),
            imageWeather.heightAnchor.constraint(equalToConstant: 100.0),
            imageWeather.widthAnchor.constraint(equalToConstant: 100.0),
            
            currentDescWeatherLabel.topAnchor.constraint(equalTo: imageWeather.bottomAnchor, constant: 2),
            currentDescWeatherLabel.rightAnchor.constraint(equalTo: viewShowWeather.rightAnchor, constant: -16),
            currentDescWeatherLabel.widthAnchor.constraint(equalToConstant: 100.0),
            
            hourlyLabel.topAnchor.constraint(equalTo: viewShowWeather.bottomAnchor, constant: 20),
            hourlyLabel.leftAnchor.constraint(equalTo: holderView.leftAnchor, constant: 16),
            hourlyLabel.rightAnchor.constraint(equalTo: holderView.rightAnchor, constant: -16),
            
            holderViewForCollectionView.topAnchor.constraint(equalTo: hourlyLabel.bottomAnchor, constant: 10),
            holderViewForCollectionView.leftAnchor.constraint(equalTo: holderView.leftAnchor, constant: 16),
            holderViewForCollectionView.rightAnchor.constraint(equalTo: holderView.rightAnchor, constant: -16),
            holderViewForCollectionView.heightAnchor.constraint(equalToConstant: 90.0),
            
            hourlyCollectionView.topAnchor.constraint(equalTo: holderViewForCollectionView.topAnchor, constant: 0),
            hourlyCollectionView.bottomAnchor.constraint(equalTo: holderViewForCollectionView.bottomAnchor, constant: 0),
            hourlyCollectionView.leftAnchor.constraint(equalTo: holderViewForCollectionView.leftAnchor, constant: 0),
            hourlyCollectionView.rightAnchor.constraint(equalTo: holderViewForCollectionView.rightAnchor, constant: 0),
            
            next7DaysLabel.topAnchor.constraint(equalTo: holderViewForCollectionView.bottomAnchor, constant: 20),
            next7DaysLabel.leftAnchor.constraint(equalTo: holderView.leftAnchor, constant: 16),
            next7DaysLabel.rightAnchor.constraint(equalTo: holderView.rightAnchor, constant: -16),
            
            next7DaysTableView.topAnchor.constraint(equalTo: next7DaysLabel.bottomAnchor, constant: 10),
            next7DaysTableView.leftAnchor.constraint(equalTo: next7DaysLabel.leftAnchor, constant: 16),
            next7DaysTableView.rightAnchor.constraint(equalTo: next7DaysLabel.rightAnchor, constant: -16),
            next7DaysTableView.bottomAnchor.constraint(equalTo: holderView.bottomAnchor, constant: 0)
            
        ])
    }
}

extension UIFont {
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
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
