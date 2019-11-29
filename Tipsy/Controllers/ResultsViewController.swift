//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by FGT MAC on 11/29/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalValue:  Double?
    var numOfPeople: Int?
    var pctNum: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
    
        totalLabel.text = String(format: "%.2f", totalValue!)
        settingsLabel.text = "Split between \(numOfPeople!) people, with  \(Int(pctNum! * 100))% tip."
       
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //On the pressed of button this view will  be dismiss and we go back to the origina view
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
