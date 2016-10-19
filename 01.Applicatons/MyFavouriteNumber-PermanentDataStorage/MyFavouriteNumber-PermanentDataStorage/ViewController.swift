//
//  ViewController.swift
//  MyFavouriteNumber-PermanentDataStorage
//
//  Created by Eric H on 14/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var saveButton: UIButton!
    @IBOutlet var favouriteNumberLabel: UILabel!
    @IBOutlet var numberEntryTF: UITextField!
    
    let favouriteNumber = "favouriteNumber"
    
    
    let defaultNumber = 0
    
    var enteredNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let toolbarDone = UIToolbar.init()
        toolbarDone.sizeToFit()
        let barBtnDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.done,
                                              target: self, action: #selector(ViewController.doneButtonAction))
        
        let flexible = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        toolbarDone.items = [flexible,barBtnDone]
        numberEntryTF.inputAccessoryView = toolbarDone
        
        
        saveButton.layer.cornerRadius = 5
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.clear.cgColor
        saveButton.layer.shadowColor = UIColor.black.cgColor
        saveButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        saveButton.layer.shadowOpacity = 0.5
        saveButton.layer.shadowRadius = 5
        
        
        let favouriteNumberObject = UserDefaults.standard.object(forKey: favouriteNumber)
        
        if let favNum = favouriteNumberObject as? Int{
            favouriteNumberLabel.text = "Your Favourite number is: \(favNum)"
            print(favNum)
        }else{
            
            favouriteNumberLabel.text = " "
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func doneButtonAction(){
        numberEntryTF.resignFirstResponder()
    }

    
    @IBAction func numberEntryTFDidEnd(_ sender: UITextField) {
        
        guard let TFTextData = sender.text, let value1 = Int(TFTextData) else {
            enteredNumber = 0
            return
        }
        enteredNumber = value1
    }
    
    @IBAction func saveButtonTapped(_ sender: AnyObject) {
        UserDefaults.standard.set(enteredNumber, forKey: favouriteNumber)
        
        let favouriteNumberObject = UserDefaults.standard.object(forKey: favouriteNumber)
        
        if let favNum = favouriteNumberObject as? Int{
            favouriteNumberLabel.text = "Your Favourite number is: \(favNum)"
            print(favNum)
        }
    }

}

