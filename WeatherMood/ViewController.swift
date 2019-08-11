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
        }
                
    }


    //got the user location
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [CLLocation]!) {
//
//        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: { (placemarks, error) in
//            if (error != nil) {
//                print("Reverse geocoder failed with error" + error!.localizedDescription)
//                return
//            }
//
//            if placemarks!.count > 0 {
//                let pm = placemarks![0] as CLPlacemark
//                // send location data
//                self.displayLocationInfo(pm)
//            } else {
//                print("Problem with the data received from geocoder")
//            }
//        })
//
//    }
//
//    // user location access failed
//    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
//        weatherOutput.text = "location access failed"
//    }
//
//    func displayLocationInfo(_ placemark: CLPlacemark) {
//            //stop updating location to save battery life
//            locationManager.stopUpdatingLocation()
//            print(placemark.location)
//
//    }

}

