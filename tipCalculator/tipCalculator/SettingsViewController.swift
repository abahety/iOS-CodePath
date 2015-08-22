//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by Bahety, Anand on 8/19/15.
//  Copyright (c) 2015 Bahety, Anand. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentageSettingSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveDefaultTipPercentage(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipPercentageSettingSegment.selectedSegmentIndex, forKey: "defaultTipPercentage")
        defaults.synchronize()
    }
    
    /* function to go back to tip calculator.
    Make a call to save default tip percentage in case user does not click anything to change
    */
    @IBAction func goBack(sender: AnyObject) {
        saveDefaultTipPercentage(sender)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        //load from previous stored setting
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("defaultTipPercentage")
        self.tipPercentageSettingSegment.selectedSegmentIndex=intValue

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
