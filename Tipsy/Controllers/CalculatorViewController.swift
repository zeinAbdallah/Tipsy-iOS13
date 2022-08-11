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
    @IBOutlet weak var splitNumberlabel: UILabel!
    
    var tip = 0.0
    var splitNumber = 2
    var billTotal = 0.0
    var billResult = "0.0"
   

    
    @IBAction func tipChanged(_ sender: UIButton) {
        //zeroPctButton.isSelected = true
        //tenPctButton.isSelected = true
        //twentyPctButton.isSelected = true
        billTextField.endEditing(true)
    
        sender.isSelected = true
        if sender.currentTitle == zeroPctButton.currentTitle {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0 / 100
        } else if sender.currentTitle == tenPctButton.currentTitle {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tip = 10 / 100
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 20 / 100
        }
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
       
        splitNumberlabel.text = String(format: "%.0f", sender.value)
        splitNumber = Int(sender.value)
       
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
        print(splitNumber)
        
        let billText = billTextField.text!
        
        if billText != "" {
            billTotal = Double(billText)!
            let result = Double(billTotal * (1 + tip) / Double(splitNumber))
            let resultString = String(format: "%.2f",  result)
            billResult = resultString
            print(resultString)
            
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "goToResult" {
           let destinationVC = segue.destination as! ResultsViewController
           
           destinationVC.billTotal = billResult
           destinationVC.tip = tip
           destinationVC.split = splitNumber
       }
    }
    
    
}

