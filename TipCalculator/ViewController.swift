//
//  ViewController.swift
//  TipCalculator
//
//  Created by Ella on 1/12/17.
//  Copyright © 2017 Ellatronic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var finalCostLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    var mealCost: Float?
    var tipPercent: Float = 20.0
    
    @IBAction func tipSliderChanged(sender: UISlider) {
        self.tipPercent = round(sender.value)
        self.tipPercentLabel.text = "\(Int(self.tipPercent))"
        
        updateFinalCostLabel()
    }
    
    @IBAction func costTextFieldChanged(_ sender: UITextField) {
        self.mealCost = Float(sender.text!)!
        
        updateFinalCostLabel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func finalCost() -> Float {
        return mealCost! + tipPercent / 100.0 * mealCost!
    }
    
    func updateFinalCostLabel() {
        if mealCost != nil {
            self.finalCostLabel.text = "\(finalCost())"
        } else if (self.costTextField.text!.isEmpty) {
            self.finalCostLabel.text = ""
        } else {
            self.finalCostLabel.text = "Invalid Cost!"
        }
    }

}

