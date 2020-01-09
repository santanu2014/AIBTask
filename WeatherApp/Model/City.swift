//
//  URLConstants.swift
//  WeatherApp
//
//  Created by Ananya on 1/9/20.
//  Copyright © 2020 Santanu Koley. All rights reserved.
//


import Foundation

public struct City: Decodable {
    public let id: Int
    public let name: String
    public let country: String
    public let coordinate: Coordinate
}
