//
//  ViewController.swift
//  SoundShaker
//
//  Created by Eric H on 24/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {

    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            
            let soundArray = ["225","226","227","237"]
            
            let randomNumber = Int(arc4random_uniform(UInt32(soundArray.count)))
            
            let audioPath = Bundle.main.path(forResource: (soundArray[randomNumber]), ofType: "mp3")
            
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
                
                player.play()
                
            }catch {
                //process errors
            }
            
        }
    }


}

