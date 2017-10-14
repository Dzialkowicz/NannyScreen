//
//  MonitorScreenViewController.swift
//  NannyScreen
//
//  Created by Jakub Sanecki on 01.10.2017.
//  Copyright © 2017 Jakub Sanecki. All rights reserved.
//

import UIKit

class MonitorScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Monitor screen loaded")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
    
    @IBAction func returnToMainMenuFromMonitor(_ sender: Any) {
        //Returns to Main Menu Screen
        print("Returning to Main Screen")
        self.performSegue(withIdentifier: "unwindFromMonitor", sender: self)
    }
    
   // let microphoneEnable = AKMicrophone()
    
    
}
