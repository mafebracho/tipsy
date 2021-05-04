//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var numberOfPeople = 2
    var finalAmount = "0.0"
    var tipPercentage = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        let pctButtons:[UIButton:Float] = [
            zeroPctButton:0,
            tenPctButton:0.1,
            twentyPctButton:0.2
        ]
        for (button,value) in pctButtons {
            if button == sender {
                tipPercentage = Double(value)
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = Float(billTextField.text!)
        
        if tenPctButton.isSelected {
            finalAmount = String(
                (bill! / Float(numberOfPeople)) +
                (bill! * 0.1) / Float(numberOfPeople))
        } else if twentyPctButton.isSelected {
            finalAmount = String(
                (bill! / Float(numberOfPeople)) +
                (bill! * 0.2) / Float(numberOfPeople))
        } else {
            finalAmount = "0"
        }
     
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.divideBetween = numberOfPeople
            destinationVC.totalAmount = finalAmount
            destinationVC.tipPercentage = tipPercentage
        }
    }
    
    /*func tipForButton(button: UIButton) -> Float {
        switch button {
        case tenPctButton:
            return 0.1
        case zeroPctButton:
            return 0
        case twentyPctButton:
            return 0.2
        default:
            return 0
        }
    } */
}

