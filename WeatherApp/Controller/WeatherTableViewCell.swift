//
//  URLConstants.swift
//  WeatherApp
//
//  Created by Ananya on 1/9/20.
//  Copyright © 2020 Santanu Koley. All rights reserved.
//


import Foundation
import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var forecastTemp: UILabel!
    @IBOutlet weak var forecastDay: UILabel!
    @IBOutlet weak var forecaseImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(forecastData: WeatherResult) {
        let rawDate = Date(timeIntervalSince1970: TimeInterval(forecastData.dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        forecaseImage.image = setWeatherImage(imageType: forecastData.weather[0].iconName)
        forecastDay.text = "\(rawDate.dayOfTheWeek())"
        forecastTemp.text = "Temperature " + String(format: "%.0f", forecastData.attributes.temperature - 273.15) + "°C"
    }
    
    // Set icon for weather day
    func setWeatherImage(imageType: WeatherIconType) -> UIImage {
        switch imageType  {
        case .clearSkyDay, .clearSkyNight :
            return UIImage(named:"clear-day")!
        case .fewCloudsDay, .fewCloudsNight, .scatteredCloudsDay, .scatteredCloudsNight :
            return UIImage(named:"cloudy")!
        case .brokenCloudsDay, .brokenCloudsNight :
            return UIImage(named:"partly-cloudy-day")!
        case .showerRainDay, .showerRainNight :
            return UIImage(named:"Rain Mini")!
        case .rainDay, .rainNight :
            return UIImage(named:"rain")!
        case .thunderstormDay, .thunderstormNigth :
             return UIImage(named:"wind")!
        default:
            return UIImage(named:"default")!
        }
    }
}
