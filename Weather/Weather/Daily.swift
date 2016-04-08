//
//  Daily.swift
//  Weather
//
//  Created by Jesús Manuel Ramos Juárez on 29/03/16.
//  Copyright © 2016 Jesús Manuel Ramos Juárez. All rights reserved.
//

import Foundation
import SwiftyJSON

final class Daily {
    
    var summary: String?
    var icon: String?
    var data: [DailyData] = [DailyData]()
    
    class DailyData {
        var time: Int?
        var summary: String?
        var icon: String?
        var sunriseTime: Int?
        var sunsetTime: Int?
        var moonPhase: Double?
        var precipIntensity: Double?
        var precipIntensityMax: Double?
        var precipIntensityMaxTime: Int?
        var precipProbability: Double?
        var precipType: String?
        var temperatureMin: Double?
        var temperatureMinTime: Int?
        var temperatureMax: Double?
        var temperatureMaxTime: Int?
        var apparentTemperatureMin: Double?
        var apparentTemperatureMinTime: Int?
        var apparentTemperatureMax: Double?
        var apparentTemperatureMaxTime: Int?
        var dewPoint: Double?
        var humidity: Double?
        var windSpeed: Double?
        var windBearing: Double?
        var visibility: Double?
        var cloudCover: Double?
        var pressure: Double?
        var ozone: Double?
    }
}