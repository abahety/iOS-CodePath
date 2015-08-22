//
//  ViewController.swift
//  tipCalculator
//
//  Created by Bahety, Anand on 8/15/15.
//  Copyright (c) 2015 Bahety, Anand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageSegment: UISegmentedControl!
    let tipPercentages=[0.15,0.18,0.20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func billAmountChanged(sender: AnyObject) {
        var billAmount = (billAmountTextField.text as NSString).doubleValue
        var tipPercentSegmentIndex = tipPercentageSegment.selectedSegmentIndex
        var tip = billAmount * tipPercentages[tipPercentSegmentIndex]
        var total = billAmount + tip
        
        tipLabel.text=String(format: "$%.2f", tip)
        totalLabel.text=String(format: "$%.2f", total)
    }
    
    // remove keyboard on tapping anywhere outside
    @IBAction func onTapping(sender: AnyObject) {
        view.endEditing(true)
    }
    
    //override this function to set tup percetage based on settings or default
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("defaultTipPercentage")
        self.tipPercentageSegment.selectedSegmentIndex=intValue
        
        // optional task - set keyboard on
        self.billAmountTextField.becomeFirstResponder()
        
        //optional task - load bill amount from previous
       self.billAmountTextField.text = defaults.stringForKey("billAmount")
        billAmountChanged(self)
        
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        //capture current bill amount to maintain between app switch
        var currentBillAmount = (billAmountTextField.text as NSString)
         var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(currentBillAmount, forKey:"billAmount")
        defaults.synchronize()
        
    }
    
}

