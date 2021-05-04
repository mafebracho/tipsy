//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Tobi on 11.08.20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var divideBetween = 2
    var totalAmount = "0.0"
    var tipPercentage = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalAmount
        settingsLabel.text = "User wants to split between \(divideBetween) people, and leave \(Int(tipPercentage * 100))% tip"

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
