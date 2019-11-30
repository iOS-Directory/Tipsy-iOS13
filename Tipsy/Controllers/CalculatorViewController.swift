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
    
    //Create an instance of CalculatorBrain for methods
    var calBrain = CalculatorBrain()
 
    var pctNum = 0.1
    var splitNum = 2
    var splittedValue = 0.0
    
    //IBAction for the tip buttons
    @IBAction func tipChanged(_ sender: UIButton) {
        //On button pressed clear all active buttons
        clearTipButtons()
        
        //Set the pressed button to active
        sender.isSelected = true

        //Turn the value into a decimal
        pctNum =  calBrain.getPCTNum(sender.currentTitle!)
 
        //Remove keyboard on click of tip
        billTextField.endEditing(true)
    }
    
    
    //IBAction for the split button -+
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        //get value and turn it into an Int
        splitNum = calBrain.getSplitValue(sender.value)
        
        //Set the label = to the value
        splitNumberLabel.text = String(splitNum)
    }
    
    
    //IBAction for calculate button
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        //Get the ammount
        let totalBill = billTextField.text!

        //Calculate precentage and split then turn it in a Float
        splittedValue = calBrain.getSplitedTotal(totalBill, pctNum, splitNum)
        
        //After creating the segue, now here we tell where to go after click on link
        self.performSegue(withIdentifier: "goToResults", sender: self)

        
    }
    
    //Clear all the tip buttons before activating   one
    func clearTipButtons(){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResults"{
            //Set a variable equal to the destination which is the name of the 2nd controller
            let desctinationVC = segue.destination as! ResultsViewController
            
            //Getting the splittedValue and to be equal to the totalValue in the 2nd view
            desctinationVC.totalValue = splittedValue
            desctinationVC.numOfPeople = splitNum
            desctinationVC.pctNum = pctNum
        }
    }
    
    
    
}

