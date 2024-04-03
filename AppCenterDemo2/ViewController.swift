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
    
    
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var retirementAgeField: UITextField!
    @IBOutlet weak var monthlyInvestmentField: UITextField!
    @IBOutlet weak var currentSavingsField: UITextField!
    @IBOutlet weak var interestRateField: UITextField!
    @IBOutlet weak var mainLabel: UILabel!
    
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
        
        let currentAge: Int? = Int(ageField.text!)
        let plannedRetirementAge: Int? = Int(retirementAgeField.text!)
        let monthlyInvestment: Float? = Float(monthlyInvestmentField.text!)
        let currentSavings: Float? = Float(currentSavingsField.text!)
        let interestRate: Float? = Float(interestRateField.text!)
        
        mainLabel.text = "If you save $\(monthlyInvestment!) every month for \(plannedRetirementAge! - currentAge!) years, and invest money plus your current investment of \(currentSavings!) at a \(interestRate!)% annual interes rate, you will have $X by the time you are \(plannedRetirementAge!)."
        
        let properties: [String: String]? = ["current age" : "\(String(currentAge!))",
                                             "retirement age" : "\(String(plannedRetirementAge!))"]
        
        Analytics.trackEvent("press-button", withProperties: properties)
    }
    
}

