//
//  ViewController.swift
//  TipsyTipCalculator
//
//  Created by James Campbell on 5/06/18.
//  Copyright © 2018 James Campbell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterBillTF: UITextField!
    @IBOutlet weak var tipPercentLbl: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    
    var tipCalcBrains = TipCalcBrains(billAmount: 25.00, tipPercent: 0.15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func billAmountChange(_ sender: Any) {
        print("bill has changed")
    }
    
    @IBAction func tipPercentChange(_ sender: Any) {
        print("tip has changed")
    }
    
}

