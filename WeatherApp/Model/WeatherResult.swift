//
//  URLConstants.swift
//  WeatherApp
//
//  Created by Ananya on 1/9/20.
//  Copyright © 2020 Santanu Koley. All rights reserved.
//


import Foundation

public struct WeatherResult: Codable {
    public let weather: [Weather]
    public let attributes: WeatherAttributes
    public let wind: Wind
    public let dt: Int
    public let date: String

    private enum CodingKeys: String, CodingKey {
        case weather
        case attributes = "main"
        case wind
        case dt
        case date = "dt_txt"
    }
}
