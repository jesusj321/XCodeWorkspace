//
//  Currently.swift
//  Weather
//
//  Created by Jesús Manuel Ramos Juárez on 29/03/16.
//  Copyright © 2016 Jesús Manuel Ramos Juárez. All rights reserved.
//

import Foundation
import SwiftyJSON

final class Currently: ResponseObjectSerializable {
    
    var time: Int?
    var summary: String?
    var icon: String?
    var nearestStormDistance: Int?
    var nearestStormBearing: Int?
    var precipIntensity: Double?
    var precipProbability: Double?
    var temperature: Double?
    var apparentTemperature: Double?
    var dewPoint: Double?
    var humidity: Double?
    var windSpeed: Double?
    var windBearing: Double?
    var visibiliy: Double?
    var cloudCover: Double?
    var pressure: Double?
    var ozone: Double?
    
    required init?(response: NSHTTPURLResponse, representation: JSON) {
        self.time = representation["time"].int
        self.summary = representation["summary"].string
        self.icon = representation["icon"].string
        self.nearestStormDistance = representation["nearestStormDistance"].int
        self.nearestStormBearing = representation["nearestStormBearing"].int
        self.precipIntensity = representation["precipIntensity"].double
        self.precipProbability = representation["precipProbability"].double
        self.temperature = representation["temperature"].double
        self.apparentTemperature = representation["apparentTemperature"].double
        self.dewPoint = representation["dewPoint"].double
        self.humidity = representation["humidity"].double
        self.windSpeed = representation["windSpeed"].double
        self.windBearing = representation["windBearing"].double
        self.visibiliy = representation["visibiliy"].double
        self.cloudCover = representation["cloudCover"].double
        self.pressure = representation["pressure"].double
        self.ozone = representation["ozone"].double
    }
    
    required init?(representation: JSON) {
        self.time = representation["time"].int
        self.summary = representation["summary"].string
        self.icon = representation["icon"].string
        self.nearestStormDistance = representation["nearestStormDistance"].int
        self.nearestStormBearing = representation["nearestStormBearing"].int
        self.precipIntensity = representation["precipIntensity"].double
        self.precipProbability = representation["precipProbability"].double
        self.temperature = representation["temperature"].double
        self.apparentTemperature = representation["apparentTemperature"].double
        self.dewPoint = representation["dewPoint"].double
        self.humidity = representation["humidity"].double
        self.windSpeed = representation["windSpeed"].double
        self.windBearing = representation["windBearing"].double
        self.visibiliy = representation["visibiliy"].double
        self.cloudCover = representation["cloudCover"].double
        self.pressure = representation["pressure"].double
        self.ozone = representation["ozone"].double
    }
}
