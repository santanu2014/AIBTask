//
//  URLConstants.swift
//  WeatherApp
//
//  Created by Ananya on 1/9/20.
//  Copyright © 2020 Santanu Koley. All rights reserved.
//

import Foundation

public struct Coordinate: Codable {
    public let latitude: Double
    public let longitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}
