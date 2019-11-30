//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by FGT MAC on 11/30/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    func getPCTNum(_ value: String) -> Double{
        return (value as NSString).doubleValue / 100
    }
    
    func getSplitValue(_ value: Double)-> Int{
        Int(value)
    }
    
    func getSplitedTotal (_ totalNum: String, _ pctNum: Double, _ splitNum: Int)-> Double{
        
    let totalBill = (totalNum as NSString).doubleValue
        
    return ((pctNum * totalBill) + totalBill) / Double(splitNum)
    }
    
}
