//
//  ViewController.swift
//  WeatherForecast-Swift
//
//  Created by Igor Golubovich on 4/10/17.
//  Copyright © 2017 IG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fetcher = CitiesFetcher()
    

    @IBAction func loadCitiesButtonTapped(_ sender: UIButton) {
       let cities = fetcher.fetchCities()
        print("\(cities)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

