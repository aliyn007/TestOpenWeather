//
//  RightNowView.swift
//  TestOpenWeather
//
//  Created by Александр on 27.03.2022.
//

import UIKit

class RightNowView: FancyView {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var tempCelcLabel: UILabel!
    
    
    @IBOutlet weak var wind_speedLabel: UILabel!
    
 
    @IBOutlet weak var humidityLabel: UILabel!
    
  
    
    
    func clear() {
        tempCelcLabel.text = ""
        wind_speedLabel.text = ""
        humidityLabel.text = ""
        dateLabel.text = ""
        cityLabel.text = ""
        weatherLabel.text = ""
        weatherImage.image = nil
    }
    
    func updateView(currentWeather: Current, city: String) {
        cityLabel.text = city
        dateLabel.text = Date.getTodaysDate()
        tempCelcLabel.text = "\(Int(currentWeather.tempCelsius))°С"
        wind_speedLabel.text = "ветер:\(Int(currentWeather.wind_speed)) м/c"
        humidityLabel.text = "Влажность:\(Int(currentWeather.humidity))%"
        weatherLabel.text = "\(Int(currentWeather.wind_deg))"
        weatherImage.image = UIImage(named: currentWeather.weather[0].icon)
    }

}
