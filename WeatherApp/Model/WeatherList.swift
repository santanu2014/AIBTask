//
//  URLConstants.swift
//  WeatherApp
//
//  Created by Ananya on 1/9/20.
//  Copyright © 2020 Santanu Koley. All rights reserved.
//

import Foundation

public struct WeatherList: Codable {
    public let message: Double
    public let cod: String  
    public let count: Int
    public let results: [WeatherResult]?
    
    private enum CodingKeys: String, CodingKey {
        case message
        case cod
        case count = "cnt"
        case results = "list"
    }
}
