//
//  ViewController.swift
//  Weather
//
//  Created by Jesús Manuel Ramos Juárez on 16/03/16.
//  Copyright © 2016 Jesús Manuel Ramos Juárez. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import JGProgressHUD

class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var currentLocation: CLLocation?
    
    let locationManager: CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count == 1 {
            self.currentLocation = locations[0]
            manager.stopUpdatingLocation()
            if let location = currentLocation {
                self.sendWeatherDataRequest(location)
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        manager.stopUpdatingLocation()
        showSimpleDialog("Error al obtener ubicación", message: error.localizedDescription)
    }
    
    func showSimpleDialog(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func refreshData(sender: UIBarButtonItem) {
        if let location = self.currentLocation {
            self.sendWeatherDataRequest(location)
        }
    }
    
    func sendWeatherDataRequest(currentLocation: CLLocation) {
        
        let progress: JGProgressHUD = JGProgressHUD(style: .Dark)
        progress.textLabel.text = "Obteniendo\ndatos del clima"
        progress.showInView(self.view)
        
        let params = ["lang": "es", "units":"si"]
        
        Alamofire.request(Router.GetWeatherData(Router.OAuthToken, currentLocation.coordinate.latitude, currentLocation.coordinate.longitude, params))
            .validate()
            .responseObject { (response: Response<WeatherData, NSError>) in
                progress.dismiss()
                switch response.result {
                case .Success(let weatherData):
                    if let temperature = weatherData.currently?.temperature {
                        self.temperatureLabel.text = "\(temperature)"
                    }
                    break
                case .Failure(let error):
                    if let d = response.data {
                        let weatherError: WeatherError = WeatherError(data: d)
                        self.showSimpleDialog("Error al obtener datos del clima", message: weatherError.error!)
                    } else {
                        self.showSimpleDialog("Error al obtener datos del clima", message: error.localizedDescription)
                    }
                    break
                }
        }
    }
}