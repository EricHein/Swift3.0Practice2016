//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Eric H on 23/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

    @IBOutlet var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = Bundle.main.path(forResource: "MP3", ofType: "mp3")
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            player.play()
            
        }catch {
            //process errors
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func playButtonTapped(_ sender: AnyObject) {
        player.play()
    }

    @IBAction func pauseButtonTapped(_ sender: AnyObject) {
        player.pause()
    }
    @IBAction func sliderMoved(_ sender: AnyObject) {
        player.volume = slider.value
    }
}

