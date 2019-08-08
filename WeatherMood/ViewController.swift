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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Ask for location Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    private func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) -> (Int, Int)? {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return nil }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        return (Int(locValue.latitude), Int(locValue.longitude))
    }


}

