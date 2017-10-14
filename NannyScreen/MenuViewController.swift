//
//  ViewController.swift
//  NannyScreen
//
//  Created by Jakub Sanecki on 26.08.2017.
//  Copyright © 2017 Jakub Sanecki. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Menu Screen loaded")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindTFromCalm(segue:UIStoryboardSegue) {
        //This function need to be performed to go back from any view controller and create unwind Segue
    }
    @IBAction func unwindFromMonitor(segue:UIStoryboardSegue) {
        //This function need to be performed to go back from any view controller and create unwind Segue
    }

    @IBAction func moveToMonitor(_ sender: UIButton) {
        //TODO: Move user to Monitor screen
        print("Moving to Monitor screen")
        self.performSegue(withIdentifier: "monitorViewSegue", sender: self)
    }
    
    @IBAction func moveToCalm(_ sender: UIButton) {
        //TODO: Move user to Calm screen
        print("Moving to Calm screen")
        self.performSegue(withIdentifier: "calmViewSegue", sender: self)
    }
    
}

