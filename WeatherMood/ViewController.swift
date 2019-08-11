//
//  ViewController.swift
//  WeatherMood
//
//  Created by Ruhsane Sawut on 8/7/19.
//  Copyright © 2019 ruhsane. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var moodInputField: UITextField!
    @IBAction func submitButton(_ sender: UIButton) {
        moodOutputField.text = "Your mood today is: " + moodInputField.text!
    }
    @IBOutlet weak var moodOutputField: UILabel!
    @IBOutlet weak var weatherOutput: UILabel!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    let key = "032b9e3ecbf2878e681a454b2d23dd09"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Ask for location Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            currentLocation = locationManager.location
            print(currentLocation.coordinate.longitude + currentLocation.coordinate.latitude)
            let lon = currentLocation.coordinate.longitude
            let lat = currentLocation.coordinate.latitude
            
            getWeatherData(lat, lon)
        }
    }
    
    func getWeatherData(_ lat: Double,_ lon: Double) {
        
        DispatchQueue.main.async {
            Alamofire.request( "https://api.openweathermap.org/data/2.5/weather?" + "lat=\(lat)" + "&lon=\(lon)" + "&units=imperial" + "&APPID=\(self.key)", method: .get, encoding: JSONEncoding.default)
                .responseJSON { response in
                    switch response.result {
                        
                    case .success(let JSON):
                        let main = JSON as! NSDictionary
                        let temp = (main["main"] as! [String: Any])["temp"]! as! Double
                        self.weatherOutput.text = String(temp)

                        
                    case .failure(let error):
                        print(error)
                    }
                }
        }
    }
    
    
}

