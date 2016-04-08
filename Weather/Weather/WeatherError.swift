//
//  WeatherError.swift
//  Weather
//
//  Created by Jesús Manuel Ramos Juárez on 29/03/16.
//  Copyright © 2016 Jesús Manuel Ramos Juárez. All rights reserved.
//

import Foundation

class WeatherError {
    
    var code: Int?
    var error: String?
    
    init(code: Int, error: String) {
        self.code = code
        self.error = error
    }
    
    init(data: NSData) {
        do {
            let jsonError = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            self.code = jsonError["code"] as? Int
            self.error = jsonError["error"] as? String
        } catch let e as NSError {
            self.code = e.code
            self.error = e.localizedDescription
        }
    }
}
