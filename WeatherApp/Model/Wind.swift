//
//  URLConstants.swift
//  WeatherApp
//
//  Created by Ananya on 1/9/20.
//  Copyright © 2020 Santanu Koley. All rights reserved.
//

import Foundation

public struct Wind: Codable {
    public let speed: Double
    public let degrees: Double?
    
    private enum CodingKeys: String, CodingKey {
        case speed
        case degrees = "deg"
    }
    
}
