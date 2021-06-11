//
//  NetworkWeatherFetch.swift
//  WeatherApp
//
//  Created by Mac mini on 11.06.2021.
//

import Foundation

class NetworkWeatherFetch {
    
    func networkWeatherFetch(withData data: Data) -> CurrentWeather? {
        
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
