//
//  next7DaysTableCell.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 18/11/21.
//

import UIKit

class next7DaysTableCell: UITableViewCell {
    static let identifier: String =  "next7DaysTableCell"

    public var dayLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 100/100)
        label.font = UIFont.rounded(ofSize: 18, weight: .medium)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 135/255, green: 135/255, blue: 135/255, alpha: 100/100)
        label.font = UIFont.rounded(ofSize: 15, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 100/100)
        label.font = UIFont.rounded(ofSize: 20, weight: .semibold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public var imageWeather: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(dayLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(imageWeather)
        contentView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            dayLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            
            dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            imageWeather.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageWeather.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            imageWeather.leftAnchor.constraint(equalTo: temperatureLabel.rightAnchor, constant: 15),
            
            temperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            temperatureLabel.rightAnchor.constraint(equalTo: imageWeather.leftAnchor, constant: -15)
        ])
    }
    
    

}
