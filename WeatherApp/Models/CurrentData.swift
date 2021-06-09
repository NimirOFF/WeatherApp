//
//  CurrentData.swift
//  WeatherApp
//
//  Created by Mac mini on 27.05.2021.
//

import Foundation

struct CurrentData: Codable {
    
    let name: String
    let main: Main
    let weather: [Weather]
    let sys: Sys
  //  let cod: Int
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}

struct Sys: Codable {
    let country: String
}
