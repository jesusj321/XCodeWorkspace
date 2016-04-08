//
//  Router.swift
//  Weather
//
//  Created by Jesús Manuel Ramos Juárez on 29/03/16.
//  Copyright © 2016 Jesús Manuel Ramos Juárez. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString = "https://api.forecast.io"
    static var OAuthToken: String = "30d95553655728c2a346bffa4f2dbcb6"
    
    case GetWeatherData(String, Double, Double, [String:AnyObject])
    
    var method: Alamofire.Method {
        switch self {
        case .GetWeatherData:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .GetWeatherData(let token, let lat, let long, _):
            return "/forecast/\(token)/\(lat),\(long)"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: Router.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        switch self {
        case .GetWeatherData(_, _, _, let params):
            return Alamofire.ParameterEncoding.URL.encode(mutableURLRequest, parameters: params).0
        }
    }
}