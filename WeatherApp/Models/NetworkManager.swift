//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Mac mini on 26.05.2021.
//

import Foundation

struct NetworkManager {
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    func fetchWeather(City city: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric&lang=ru"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
        if let data = data {
            if let currentWeather = self.parseJSON(withData: data) {
                self.onCompletion?(currentWeather)
            }
        }
    }.resume()
}
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        
        let decoder = JSONDecoder()
        do {
            let currentData = try decoder.decode(CurrentData.self, from: data)
            guard let currentWeather = CurrentWeather(currentData: currentData) else { return nil }
            return currentWeather
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}

