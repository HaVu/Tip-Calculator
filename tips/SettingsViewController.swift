//
//  SettingsViewController.swift
//  tips
//
//  Created by Ha Vu on 3/2/16.
//  Copyright © 2016 AmbrosaVN. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaulTipControler: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipSegmentIndex = defaults.integerForKey("defaultTip")
        self.defaulTipControler.selectedSegmentIndex = defaultTipSegmentIndex
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func updateDefaultTipPercentage(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaulTipControler.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }

}
