//
//  CitiesFetcher.swift
//  WeatherForecast-Swift
//
//  Created by Igor Golubovich on 4/10/17.
//  Copyright © 2017 IG. All rights reserved.
//

import Foundation

protocol CitiesFetcherInterface {
    func fetchCities() -> Array<City>
}

class City {
    var cityName : String = ""
    var country : String = ""
}

class CitiesFetcher: CitiesFetcherInterface {
    
    func fetchCities() -> Array<City> {
        let pathForResource = Bundle.main.path(forResource: "city_list", ofType: "json")
        print("\(String(describing: pathForResource))")
        let data = NSData.init(contentsOfFile: pathForResource!)!
        do {
            let dict = try JSONSerialization.jsonObject(with: (data) as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, AnyObject>
            
            var finalArray = Array<City>()
            let citiesToParse = dict["list"] as! Array<Dictionary<String,Any>>
            for city in citiesToParse {
                let cityItem = City()
                cityItem.cityName = city["name"] as! String
                cityItem.country = city["country"] as! String
                finalArray.append(cityItem)
            }
            
            
            
            return finalArray
        }
        catch let error as NSError {
            print(error)
            return Array()
        }
        
        //        for dictToParse in dict {
        //            print("\(dictToParse[country])")
        //        }
        
        //print("\(dict)")
        //return Array()
    }
}
