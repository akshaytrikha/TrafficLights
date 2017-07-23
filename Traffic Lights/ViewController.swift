//
//  ViewController.swift
//  Traffic Lights
//
//  Created by Akshay Trikha on 14/7/17.
//  Copyright © 2017 ATronics. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countdownTimer = Timer()
    var reactionTimer = Timer()
    
    var countdownValue = 0
    var score : double_t  = 0.0
    
    var buttonPressCount = 0
    
    
    
    @IBOutlet var trafficLight: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var startStopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startStopButton.layer.cornerRadius = 50
        
        score = 0
        label.text = String(score)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func startStop(_ sender: Any) {
        
        buttonPressCount += 1
        
        if (buttonPressCount % 2 == 0) {
            
            reactionTimer.invalidate()
            startStopButton.setTitle("play again", for: .normal)
            
        } else {
            
            score = 0.0
            
            countdownValue = 4
            
            countdownTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
            
            startStopButton.isEnabled = false
            startStopButton.setTitle("", for: .normal)
        
        }
    }
    
    func updateCountdown() {
        
        countdownValue -= 1
        
        switch (countdownValue) {
            
            case 0: trafficLight.image = UIImage(named: "TrafficLight")
                    countdownTimer.invalidate()
            reactionTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
                startStopButton.isEnabled = true
            
            case 1: trafficLight.image = UIImage(named: "TrafficLight3")
                startStopButton.setTitle("stop", for: [])
            
            case 2: trafficLight.image = UIImage(named: "TrafficLight2")
                    score = 0
            
            case 3: trafficLight.image = UIImage(named: "TrafficLight1")
            
            default: trafficLight.image = UIImage(named: "TrafficLight")
            
            
            
        }
    }
    
    func updateScoreTimer() {
        
        score += 1
        label.text = String(score)
        
    }

}

