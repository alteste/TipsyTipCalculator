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
    
    @IBOutlet weak var splitNumberLbl: UILabel!
    @IBOutlet weak var splitNumberSlider: UISlider!
    @IBOutlet weak var splitAmountLbl: UILabel!
    
    var tipCalcBrains = TipCalcBrains(billAmount: 25.00, tipPercent: 0.15, splitNumber: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPercentValue()
        splitNumberValue()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func billAmountChange(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func tipPercentChange(_ sender: Any) {
        tipPercentValue()
        calculateTip()
    }
    
    func calculateTip() {
        tipCalcBrains.tipPercent = Double(tipPercentSlider.value)
        tipCalcBrains.billAmount = ((enterBillTF.text)! as NSString).doubleValue
        tipCalcBrains.calculateTip()
        calculateSplit()
        updateBillUI()
    }
    
    func updateBillUI() {
        totalAmountLbl.text = String(format: "$%0.2f", tipCalcBrains.totalAmount)
        tipAmountLbl.text = String(format: "$%0.2f", tipCalcBrains.tipAmount)
    }
    
    func tipPercentValue() {
        tipPercentLbl.text = "Tip: \(Int(tipPercentSlider.value * 100))%"
    }
    
    @IBAction func splitNumberChange(_ sender: Any) {
        splitNumberValue()
        calculateSplit()
    }
    
    func calculateSplit() {
        tipCalcBrains.splitNumber = Int(splitNumberSlider.value)
        tipCalcBrains.calculateSplit()
        updateSplitUI()
    }
    
    func updateSplitUI() {
        splitAmountLbl.text = String(format: "$%0.2f", tipCalcBrains.splitAmount)
    }
    
    func splitNumberValue() {
        splitNumberLbl.text = "Split: \(Int(splitNumberSlider.value))"
    }
    
}

