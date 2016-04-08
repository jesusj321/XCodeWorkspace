//
//  Hourly.swift
//  Weather
//
//  Created by Jesús Manuel Ramos Juárez on 29/03/16.
//  Copyright © 2016 Jesús Manuel Ramos Juárez. All rights reserved.
//

import Foundation
import SwiftyJSON

final class Hourly: ResponseObjectSerializable {
    
    var summary: String?
    var icon: String?
    var data: [HourlyData] = [HourlyData]()
    
    required init?(response: NSHTTPURLResponse, representation: JSON) {
        self.summary = representation["summary"].string
        self.icon = representation["icon"].string
        self.data = HourlyData.collection(response, representation: representation["data"])
    }
    
    required init?(representation: JSON) {
        self.summary = representation["summary"].string
        self.icon = representation["icon"].string
        self.data = HourlyData.collection(representation["data"])
    }
    
    final class HourlyData: ResponseObjectSerializable, ResponseCollectionSerializable {
        
        var time: Double?
        var summary: String?
        var icon: String?
        var precipIntensity: Double?
        var precipProbability: Double?
        var precipType: String?
        var temperature: Double?
        var apparentTemperature: Double?
        var dewPoint: Double?
        var humidity: Double?
        var windSpeed: Double?
        var windBearing: Double?
        var visibility: Double?
        var cloudCover: Double?
        var pressure: Double?
        var ozone: Double?
        
        required init?(response: NSHTTPURLResponse, representation: JSON) {
            self.time = representation["time"].double
            self.summary = representation["summary"].string
            self.icon = representation["icon"].string
            self.precipIntensity = representation["precipIntensity"].double
            self.precipProbability = representation["precipProbability"].double
            self.precipType = representation["precipType"].string
            self.temperature = representation["temperature"].double
            self.apparentTemperature = representation["apparentTemperature"].double
            self.dewPoint = representation["dewPoint"].double
            self.humidity = representation["humidity"].double
            self.windSpeed = representation["windSpeed"].double
            self.windBearing = representation["windBearing"].double
            self.visibility = representation["visibility"].double
            self.cloudCover = representation["cloudCover"].double
            self.pressure = representation["pressure"].double
            self.ozone = representation["ozone"].double
        }
        
        required init?(representation: JSON) {
            self.time = representation["time"].double
            self.summary = representation["summary"].string
            self.icon = representation["icon"].string
            self.precipIntensity = representation["precipIntensity"].double
            self.precipProbability = representation["precipProbability"].double
            self.precipType = representation["precipType"].string
            self.temperature = representation["temperature"].double
            self.apparentTemperature = representation["apparentTemperature"].double
            self.dewPoint = representation["dewPoint"].double
            self.humidity = representation["humidity"].double
            self.windSpeed = representation["windSpeed"].double
            self.windBearing = representation["windBearing"].double
            self.visibility = representation["visibility"].double
            self.cloudCover = representation["cloudCover"].double
            self.pressure = representation["pressure"].double
            self.ozone = representation["ozone"].double
        }
        
        static func collection(response: NSHTTPURLResponse, representation: JSON) -> [HourlyData] {
            var hdArray = [HourlyData]()
            if let hourlyData = representation.array {
                for json in hourlyData {
                    let hd = HourlyData(representation: json)
                    if let h = hd {
                        hdArray.append(h)
                    }
                }
            }
            return hdArray
        }
        
        static func collection(representation: JSON) -> [HourlyData] {
            var hdArray = [HourlyData]()
            if let hourlyData = representation.array {
                for json in hourlyData {
                    let hd = HourlyData(representation: json)
                    if let h = hd {
                        hdArray.append(h)
                    }
                }
            }
            return hdArray
        }
    }
}