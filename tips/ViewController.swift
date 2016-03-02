//
//  ViewController.swift
//  tips
//
//  Created by Ha Vu on 2/29/16.
//  Copyright © 2016 AmbrosaVN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipSegmentIndex = defaults.integerForKey("defaultTip")
        self.tipPercentageControl.selectedSegmentIndex = defaultTipSegmentIndex
        
        self.billAmountTextField.text = defaults.objectForKey("loadBillAmount") as? String
        self.tipAmountLabel.text = defaults.objectForKey("loadTipAmount") as? String
        self.totalAmountLabel.text = defaults.objectForKey("loadTotalAmount") as? String
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func billAmountEntered(sender: AnyObject) {
        updateAllValue()
    }

    @IBAction func onScreenTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateAllValue() {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipPercentageControl.selectedSegmentIndex]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipPercentageControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
        
        
        let billAmount = NSString(string: billAmountTextField.text!).doubleValue
        let tipAmount = billAmount * tipPercentage
        let totalAmount = billAmount + tipAmount
        
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
        totalAmountLabel.text = String(format: "$%.2f", totalAmount)
        
        defaults.setObject(billAmountTextField.text, forKey: "loadBillAmount")
        defaults.setObject(tipAmountLabel.text, forKey: "loadTipAmount")
        defaults.setObject(totalAmountLabel.text, forKey: "loadTotalAmount")

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipSegmentIndex = defaults.integerForKey("defaultTip")
        self.tipPercentageControl.selectedSegmentIndex = defaultTipSegmentIndex
        
        updateAllValue()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

}

