//
//  ViewController.swift
//  AppCenterDemo2
//
//  Created by Harun Gunes on 03/04/2024.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {
    
    
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var retirementAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Oops", message: "App crashed", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It's cool", style: .default))
            self.present(alert, animated: true)
        }
        
        Analytics.trackEvent("navigate-to-app")
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
//        Crashes.generateTestCrash()
        
        let currentAge: Int? = Int(age.text!)
        let plannedRetirementAge: Int? = Int(retirementAge.text!)
        
        let properties: [String: String]? = ["current age" : "\(String(currentAge!))",
                                             "retirement age" : "\(String(plannedRetirementAge!))"]
        
        Analytics.trackEvent("press-button", withProperties: properties)
    }
    
}

