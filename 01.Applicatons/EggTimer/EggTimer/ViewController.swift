//
//  ViewController.swift
//  EggTimer
//
//  Created by Eric H on 11/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var totalSeconds = 210
    var countDownSeconds = 210

    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var pauseButton: UIButton!
    
    @IBOutlet var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = String(countDownSeconds)
        pauseButton.isHidden = true
        resetButton.isHidden = true
        
        
        resetButton.layer.cornerRadius = 5
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor.clear.cgColor
        resetButton.layer.shadowColor = UIColor.black.cgColor
        resetButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        resetButton.layer.shadowOpacity = 0.5
        resetButton.layer.shadowRadius = 5
        
        
        pauseButton.layer.cornerRadius = 5
        pauseButton.layer.borderWidth = 1
        pauseButton.layer.borderColor = UIColor.clear.cgColor
        pauseButton.layer.shadowColor = UIColor.black.cgColor
        pauseButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        pauseButton.layer.shadowOpacity = 0.5
        pauseButton.layer.shadowRadius = 5
        
        
        startButton.layer.cornerRadius = 5
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = UIColor.clear.cgColor
        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        startButton.layer.shadowOpacity = 0.5
        startButton.layer.shadowRadius = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func startTimerTapped(_ sender: UIButton) {
        startButton.isHidden = true
        pauseButton.isHidden = false
        resetButton.isHidden = false
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        
        
    }

    @IBAction func pauseTimerTapped(_ sender: UIButton) {
        timer.invalidate()
        pauseButton.isHidden = true
        startButton.isHidden = false
    }
    
    func processTimer(){
        if countDownSeconds > 0{
            countDownSeconds -= 1
            timerLabel.text = String(countDownSeconds)
        }else{
            timer.invalidate()
            timerLabel.text = "Time Up!"
            startButton.isHidden = false
        }
    }

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        resetButton.isHidden = true
        pauseButton.isHidden = true
        startButton.isHidden = false
        
        timer.invalidate()
        countDownSeconds = totalSeconds
        timerLabel.text = String(countDownSeconds)
        
    }
}

