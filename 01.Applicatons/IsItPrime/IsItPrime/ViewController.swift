//
//  ViewController.swift
//  IsItPrime
//
//  Created by Eric H on 27/09/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet var resultLabel: UILabel!
    
    
    @IBOutlet var inputTF: UITextField!
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        let barBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done,
                                              target: self, action: #selector(ViewController.doneButtonAction))
        
        let flexible = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        toolbarDone.items = [flexible,barBtnDone]
        
        inputTF.inputAccessoryView = toolbarDone
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func doneButtonAction(){
        inputTF.resignFirstResponder()
    }

    @IBAction func inputTFEnded(_ sender: UITextField) {
        
        guard let TFTextData = sender.text, let value1 = Int(TFTextData) else {
            resultLabel.text = "Enter a number."
            return
        }
        
        var isPrime = true
        var i = 2
        
        if value1 == 1{
            isPrime = false
        }
        
        
        while i < value1 {
            if value1 % i == 0{
                isPrime = false
            }
            i += 1
        }
        
        if isPrime {
            resultLabel.text = "\(value1) is a prime."
        }else{
            
            resultLabel.text = "\(value1) is not a prime."
        }
        
    }

}

