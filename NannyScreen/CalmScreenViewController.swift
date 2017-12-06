//
//  CalmScreenViewController.swift
//  NannyScreen
//
//  Created by Jakub Sanecki on 01.10.2017.
//  Copyright © 2017 Jakub Sanecki. All rights reserved.
//

import UIKit
import AudioKit
import AVFoundation

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
        dismiss(animated: true, completion: nil)
    }
    @IBAction func dishwasherSound(_ sender: UIButton) {
//AudioKit version - not working properly
//        let hairdryerSound = try! AKAudioFile(readFileName: Bundle.main.path(forResource: "Hairdryer", ofType: "m4a")!)
//        let hairdryerPlayer = try! AKAudioPlayer(file: hairdryerSound) {
//            print("Player initialized!")
//        }
//
//        AudioKit.output = hairdryerPlayer
//        AudioKit.start()
//        hairdryerPlayer.looping = true
    var hairDryerPlayer = AVAudioPlayer()
        do{
            hairDryerPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Hairdryer", ofType: "m4a")!))
            hairDryerPlayer.prepareToPlay()
            hairDryerPlayer.play()
            print("hairDryer is playing")
        }
        catch{
            print(error)
        }
        
    }
    
    @IBAction func washingMachineSound(_ sender: AnyObject) {
//        let washingMachineSound = try! AKAudioFile(readFileName: "WashingMachine.m4a")
//        let washingMachinePlayer = try! AKAudioPlayer(file: washingMachineSound) {
//            print("Player initialized!")
//        }
//
//        AudioKit.output = washingMachinePlayer
//        AudioKit.start()
//        washingMachinePlayer.looping = true
        var washingMachinePlayer = AVAudioPlayer()
        do{
            washingMachinePlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Wash_Hands_Running_Water", ofType: "mp3")!))
            washingMachinePlayer.prepareToPlay()
            washingMachinePlayer.play()
            print("washingMachine is playing")
        }
        catch{
            print(error)
        }
    
    }
    
    
    
    
    
}

