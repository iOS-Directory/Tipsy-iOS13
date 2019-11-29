//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
 
    var pctNum: Double?
    var splitNum: Int?
    //IBActions for all inputs
    
    //IBAction for the tip buttons
    @IBAction func tipChanged(_ sender: UIButton) {
        //On button pressed clear all active buttons
        clearTipButtons()
        
        //Set the pressed button to active
        sender.isSelected = true
        
        //Get the value of the button
        let pctStr =  sender.currentTitle!
        
        //Turn the value into a decimal
        pctNum = (pctStr as NSString).doubleValue / 100
        billTextField.endEditing(true)
    }
    
    
    //IBAction for the split button -+
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //get value and turn it into an Int
        splitNum = Int(sender.value)
        
        //Set the label = to the value
        splitNumberLabel.text = String(splitNum!)
    }
    
    //IBAction for calculate button
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        //Get the ammount
        let totalBill = billTextField.text
        
        //Turn string into a Double for the equation
        let totalNum = (totalBill! as NSString).doubleValue
    billTextField.endEditing(true)
        
        //Calculate precentage and split then turn it in a Float
        let totalForEach = Float(((pctNum! * totalNum) + totalNum) / Double(splitNum!))
    }
    
    //Clear all the tip buttons before activating   one
    func clearTipButtons(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
}

