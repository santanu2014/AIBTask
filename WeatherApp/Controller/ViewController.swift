//
//  URLConstants.swift
//  WeatherApp
//
//  Created by Ananya on 1/9/20.
//  Copyright © 2020 Santanu Koley. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet var weatherTableView: UITableView!
    var weatherData: WeatherList?
    var weatherArray: [WeatherResult]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Call API
        let apiService = WeatherAPIService()
        //Reload data Source
        apiService.loadWeatherData { results in
            self.weatherData = results
            self.weatherArray = self.weatherData?.results
            DispatchQueue.main.async {
                self.weatherTableView.reloadData()
            }
        }
    }
}

//Deleagte for tableview
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell") as! WeatherTableViewCell
        
        guard let weatherData = weatherArray else {
            return cell
        }
        
        cell.configureCell(forecastData: weatherData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherArray?.count ?? 0
    }
}

