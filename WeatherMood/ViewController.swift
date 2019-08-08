//
//  ViewController.swift
//  WeatherMood
//
//  Created by Ruhsane Sawut on 8/7/19.
//  Copyright © 2019 ruhsane. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var moodInputField: UITextField!
    @IBAction func submitButton(_ sender: UIButton) {
        moodOutputField.text = "Your mood today is: " + moodInputField.text!
    }
    @IBOutlet weak var moodOutputField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }


}

