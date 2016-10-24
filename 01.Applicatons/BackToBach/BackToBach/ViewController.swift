//
//  ViewController.swift
//  BackToBach
//
//  Created by Eric H on 24/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBOutlet var trackSlider: UISlider!
    
    var timer = Timer()
    
    var player = AVAudioPlayer()
    
    
    let audioPath = Bundle.main.path(forResource: "MP3", ofType: "mp3")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            trackSlider.maximumValue = Float(player.duration)
            
        }catch {
            //process errors
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func playButtonTapped(_ sender: AnyObject) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target:self,  selector: #selector(ViewController.updateScrubber), userInfo:nil, repeats: true)
    }
    
    func updateScrubber(){
        trackSlider.value = Float(player.currentTime)
    }

    @IBAction func pauseButtonTapped(_ sender: AnyObject) {
        player.pause()
        timer.invalidate()
    }
    
    
    @IBAction func stopButtonTapped(_ sender: AnyObject) {
         trackSlider.value = 0
        
        player.pause()
        
        timer.invalidate()
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            
        }catch {
            //process errors
        }
    }
    
    @IBAction func trackSliderChanged(_ sender: AnyObject) {
        player.currentTime = TimeInterval(trackSlider.value)
    }
    @IBAction func volumeSliderChanged(_ sender: AnyObject) {
        player.volume = volumeSlider.value
    }
}

