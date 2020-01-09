//
//  URLConstants.swift
//  WeatherApp
//
//  Created by Ananya on 1/9/20.
//  Copyright © 2020 Santanu Koley. All rights reserved.
//

import Foundation
import Alamofire

typealias DownloadComplete = () -> ()

final class WeatherAPIService {
    
    func loadWeatherData(completion: @escaping (WeatherList?) -> Void) {
        Alamofire.request(APIConstants.apiURL).responseData { (response) in
            
            guard response.result.error == nil else {
                print(response.result.error!)
                return
            }
            
            guard let responseData = response.data else {
                print(response.result.error!)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(WeatherList.self, from: responseData)
                completion(results)
            } catch let error {
                print("Unable to decode. Error is: \(error)")
                completion(nil)
            }
        }
    }
}

// MARK: - Date Extension to covert date to a day in String type.
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd/MM/YYYY hh:mm a"
        return dateFormatter.string(from: self)
    }
}
