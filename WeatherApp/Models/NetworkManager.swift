//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Mac mini on 26.05.2021.
//

import Foundation

class NetworkManager {
    
    var weatherCompletion: ((CurrentWeather) -> Void)?
    var networkWeatherFetch = NetworkWeatherFetch()
    
    init(networkWeatherFetch: NetworkWeatherFetch = NetworkWeatherFetch()) {
        self.networkWeatherFetch = networkWeatherFetch
    }
    
    func requestNetworkWeather(City city: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric&lang=ru"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
        if let data = data {
            if let currentWeather = self.networkWeatherFetch.networkWeatherFetch(withData: data) {
                self.weatherCompletion?(currentWeather)
            }
        }
    }.resume()
  }
}

