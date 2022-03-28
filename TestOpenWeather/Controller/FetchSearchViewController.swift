//
//  FetchSearchViewController.swift
//  TestOpenWeather
//
//  Created by Александр on 26.03.2022.
//

import UIKit

class FetchSearchViewController: UIViewController {

    
    @IBOutlet weak var cityNameTextField: UITextField!
  
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var imageWeather: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tabFetchWeatherBtn(_ sender: UIButton) {
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    
    // weatherInfo method
    func configureView(weatherSearch: WeatherSearch) {
        self.cityNameLabel.text = weatherSearch.name
       
        if let weather = weatherSearch.weather.first {
        
            self.weatherDescriptionLabel.text = weather.description
        }
        self.tempLabel.text = "\(Int(weatherSearch.temp.temp))°C"
        self.imageWeather.image = UIImage(named: weatherSearch.weather[0].icon)
        self.minTempLabel.text = "min: \(Int(weatherSearch.temp.minTemp))°C"
        self.maxTempLabel.text = "Max: \(Int(weatherSearch.temp.maxTemp))°C"
    }
    
    // Error message  alert logic
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // URLSession  currentWeather API
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&units=metric&lang=ua&appid=564fb9a616996b0758b76fe892828ce8") else { return }
    
        let session = URLSession(configuration: .default)
     
        session.dataTask(with: url) { [weak self] data, response, error in
            
            let successRange = (200..<300)
            guard let data = data, error == nil else { return }
            let decorder = JSONDecoder()
       
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                guard let weatherSearch =  try? decorder.decode(WeatherSearch.self, from: data) else { return }
                // debugPrint(weatherInfo)
                
                DispatchQueue.main.async {
              
                    self?.configureView(weatherSearch: weatherSearch)
                    }
                } else {
                    guard let errorMessage = try? decorder.decode(ErrorMessage.self, from: data) else { return }
                     debugPrint(errorMessage)
                  
                    DispatchQueue.main.async {
                        self?.showAlert(message: errorMessage.message)
                    }
            }
        }.resume()
    }
}




