//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mac mini on 25.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel :UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var currentDay: UILabel!
    @IBOutlet weak var temperatyreLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var networkManager = NetworkManager()
    
    
    
    @IBAction func searchPressed(_ sender: UIButton!) {
        
        self.searchAlertController(withTitle: "Введите город", message: nil, style: .alert) { city in
            self.networkManager.fetchWeather(City: city)
        }
}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.weatherCompletion = { currentWeather in
            self.updateInterface(weather: currentWeather)
        }
        networkManager.fetchWeather(City: "Yekaterinburg")
    }
    
    func updateInterface(weather: CurrentWeather) {
        
        DispatchQueue.main.async {
            
            self.cityLabel.text = weather.cityName
            self.countryLabel.text = weather.countryName
            self.temperatyreLabel.text = weather.temperatureString
            self.weatherIcon.image = UIImage(named: weather.iconName)
            self.backgroundImage.image = UIImage(named: weather.imageName)
            self.currentDate.text = self.getCurrentDate()
            self.currentDay.text = self.getCurrentDay()
        }
    }
}

