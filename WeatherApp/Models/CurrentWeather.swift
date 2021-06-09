//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Mac mini on 27.05.2021.
//

import Foundation

struct CurrentWeather {
    
    let cityName: String
    let countryName: String
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let conditionCode: Int
    var iconName: String {
        
        switch conditionCode {
        case 200...232: return "008-storm"
        case 300...321: return "003-rainy"
        case 500...531: return "004-rainy-1"
        case 600...622: return "006-snowy"
        case 701...781: return "017-foog"
        case 800: return "039-sun"
        case 801...804: return "001-cloud"
        default: return "nosign"
            
        }
    }
    
    var imageName: String {
        
        switch conditionCode {
        case 200...232: return "Thunder"
        case 300...321: return "rain"
        case 500...531: return "rain"
        case 600...622: return "Snow"
        case 701...781: return "Fog"
        case 800: return "Weather background"
        case 801...804: return "Cloud day"
        default: return "Weather background"
        }
    }
    
//    let httpError: Int
//    var error: String {
//
//        switch httpError {
//        case 404: return "404"
//        case 429: return "429"
//        default: return "good"
//        }
//    }
    
    
    init?(currentData: CurrentData) {
        
        cityName = currentData.name
        countryName = currentData.sys.country
        temperature = currentData.main.temp
        conditionCode = currentData.weather.first!.id
      //  httpError = currentData.cod
    }
}
