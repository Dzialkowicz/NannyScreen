//
//  MonitorScreenViewController.swift
//  NannyScreen
//
//  Created by Jakub Sanecki on 01.10.2017.
//  Copyright © 2017 Jakub Sanecki. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI


class MonitorScreenViewController: UIViewController {
    
    @IBOutlet private var audioInputPlot: EZAudioPlot!
    @IBOutlet private var AmpVal: UILabel!
    @IBOutlet private var FreqVal: UILabel!
    
    var microphone:  AKMicrophone!
    var freqTracker: AKFrequencyTracker!
    var silence: AKBooster!
    
    //Phone number declaration
    var telNo:NSURL = NSURL(string: "tel://1234568")!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
    
    @IBAction func returnToMainMenuFromMonitor(_ sender: Any) {
        //Returns to Main Menu Screen
        print("Returning to Main Screen")
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func setSoundPlot (){
        let plot = AKNodeOutputPlot(microphone, frame: audioInputPlot.bounds)
        plot.plotType = .rolling
        plot.shouldFill = true
        //For audio plot purpose
        plot.shouldMirror = true
        //Set up Green color
        plot.color = UIColor.green
        //Displaying the plot
        audioInputPlot.addSubview(plot)
    }
    
    @objc func UpdatePlot(){
        //Updating plot after 0.1 tick
        if freqTracker.amplitude > 0.1{
            //Updating Frequency and Amplitude
            AmpVal.text = String(format: "%0.6f", freqTracker.amplitude)
            FreqVal.text = String(format: "%0.6f", freqTracker.frequency)
        }
        let FallingText = "SOMETHING FELL"
        let CryingText = "CHILD CRIES"
        //Condition to send when something falls
        if(freqTracker.amplitude > 0.5 && freqTracker.frequency > 1000){
            print(FallingText)
            //TODO - somehow inform parents that something fell
        }
        else if((freqTracker.amplitude < 0.5 && freqTracker.amplitude > 0.3) && (freqTracker.frequency < 500 && freqTracker.frequency > 100 )){
            print(CryingText)
            //TODO - somehow inform parents that child cries
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Monitor screen loaded")
        
    }
    
    
    @IBAction func startRecording(_ sender: UIButton) {
        //: after a var means that this variable later can be changed
        
        //Microphone turned on
        AKSettings.audioInputEnabled = true
        //Created instance of AKMicrophone() to get audio
        microphone = AKMicrophone()
        
        //Initializing AKFrequencyTracker, AKBooster with default values
        freqTracker = AKFrequencyTracker(microphone)
        silence = AKBooster(freqTracker, gain: 0 )
        
        //Setting up zero before measuring
        AudioKit.output = silence
        //Starting up audio engine
        AudioKit.start()
        
        //Condition to send when child cries
        
        
        //Setting up plot
        setSoundPlot()
        Timer.scheduledTimer(timeInterval: 0.1,
                             target: self,
                             selector: #selector(UpdatePlot),
                             userInfo: nil,
                             repeats: true)
        
        
    }
    
}
