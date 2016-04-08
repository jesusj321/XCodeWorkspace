//
//  WeatherData.swift
//  Weather
//
//  Created by Jesús Manuel Ramos Juárez on 19/03/16.
//  Copyright © 2016 Jesús Manuel Ramos Juárez. All rights reserved.
//

import Foundation
import SwiftyJSON

final class WeatherData: ResponseObjectSerializable {
    
    var latitude: Double?
    var longitude: Double?
    var timezone: String?
    var offset: Double?
    var currently: Currently?
    var minutely: Minutely?
    var hourly: Hourly?
    //var daily: Daily?
    
    required init?(response: NSHTTPURLResponse, representation: JSON) {
        self.latitude = representation["latitude"].double// as? Double //["latitude"].doubleValue
        self.longitude = representation["longitude"].double//as? Double
        self.timezone = representation["timezone"].string// as? String
        self.currently = Currently(response: response, representation: representation["currently"])
        self.minutely = Minutely(response: response, representation: representation["minutely"])
        self.hourly = Hourly(response: response, representation: representation["hourly"])
    }
    
    required init?(representation: JSON) {
        self.latitude = representation["latitude"].double
        self.longitude = representation["longitude"].double
        self.timezone = representation["timezone"].string
        self.currently = Currently(representation: representation["currently"])
        self.minutely = Minutely(representation: representation["minutely"])
        self.hourly = Hourly(representation: representation["hourly"])
    }
}