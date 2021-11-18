//
//  hourlyCollectionCell.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 18/11/21.
//

import UIKit

class hourlyCollectionCell: UICollectionViewCell {
    static let identifier: String = "hourlyCollectionCell"
    
    public var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 100/100)
        label.font = UIFont.rounded(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public var weatherImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    public var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 100/100)
        label.font = UIFont.rounded(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
    }
    
    private func addView() {
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.layer.cornerRadius = 8
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(weatherImage)
        contentView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            timeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            weatherImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            weatherImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            weatherImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            weatherImage.heightAnchor.constraint(equalToConstant: 30.0),
            
            temperatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            temperatureLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            temperatureLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5)
        ])
    }
}
