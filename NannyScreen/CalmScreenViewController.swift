//
//  CalmScreenViewController.swift
//  NannyScreen
//
//  Created by Jakub Sanecki on 01.10.2017.
//  Copyright © 2017 Jakub Sanecki. All rights reserved.
//

import UIKit


extension UIImageView {
        //Defining a circle buttons to be used in Calm screen
    
    func setCircleButton() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
    
}

class CalmScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Calm screen loaded")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnToMainMenuButton(_ sender: Any) {
        //Returns to Main Menu Screen
        print("Returning to Main Screen")
        self.performSegue(withIdentifier: "unwindFromCalm", sender: self)
    }
    
    
    
    
}

