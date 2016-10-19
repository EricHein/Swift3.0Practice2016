//
//  ViewController.swift
//  MenuBars
//
//  Created by Eric H on 27/09/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func barButtonLeftTapped(_ sender: AnyObject) {
        print ("Camera Pressed")
        timer.invalidate()
    }
    
    func processTimer(){
        print ("A second has passed")
    }

}

