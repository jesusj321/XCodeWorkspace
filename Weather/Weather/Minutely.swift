//
//  Minutely.swift
//  Weather
//
//  Created by Jesús Manuel Ramos Juárez on 29/03/16.
//  Copyright © 2016 Jesús Manuel Ramos Juárez. All rights reserved.
//

import Foundation
import SwiftyJSON

final class Minutely: ResponseObjectSerializable {
    
    var summary: String?
    var icon: String?
    var data: [MinutelyData] = [MinutelyData]()
    
    required init?(response: NSHTTPURLResponse, representation: JSON) {
        self.summary = representation["summary"].string
        self.icon = representation["icon"].string
        self.data = MinutelyData.collection(response, representation: representation["data"])
    }
    
    required init?(representation: JSON) {
        self.summary = representation["summary"].string
        self.icon = representation["icon"].string
        self.data = MinutelyData.collection(representation["data"])
    }
    
    final class MinutelyData: ResponseObjectSerializable, ResponseCollectionSerializable {
        
        var time: Double?
        var precipIntensity: Double?
        var precipProbability: Double?
        
        required init?(response: NSHTTPURLResponse, representation: JSON) {
            self.time = representation["time"].double
            self.precipIntensity = representation["precipIntensity"].double
            self.precipProbability = representation["precipProbability"].double
        }
        
        required init?(representation: JSON) {
            self.time = representation["time"].double
            self.precipIntensity = representation["precipIntensity"].double
            self.precipProbability = representation["precipProbability"].double
        }
        
        static func collection(response: NSHTTPURLResponse, representation: JSON) -> [MinutelyData] {
            var mdArray = [MinutelyData]()
            if let minutelyDataArray = representation.array {
                for json in minutelyDataArray {
                    let md = MinutelyData(representation: json)
                    if let m = md {
                        mdArray.append(m)
                    }
                }
            }
            return mdArray
        }
        
        static func collection(representation: JSON) -> [MinutelyData] {
            var mdArray = [MinutelyData]()
            if let minutelyDataArray = representation.array {
                for json in minutelyDataArray {
                    let md = MinutelyData(representation: json)
                    if let m = md {
                        mdArray.append(m)
                    }
                }
            }
            return mdArray
        }
    }
}