//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Eric H on 15/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var itemNameTF: UITextField!
    
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addButton.layer.cornerRadius = 5
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.clear.cgColor
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        addButton.layer.shadowOpacity = 0.5
        addButton.layer.shadowRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addButtonTapped(_ sender: AnyObject) {
        
        
        let itemsObject = UserDefaults.standard.object(forKey: Constants.persistentArray.kPersistentArray)
        
        var items:[String]
        
        if let tempItems = itemsObject as? [String]{
            
            items = tempItems
            items.append(itemNameTF.text!)
        }else{
            items = [itemNameTF.text!]
        }
        
        itemNameTF.resignFirstResponder()
        UserDefaults.standard.set(items, forKey: Constants.persistentArray.kPersistentArray)
        itemNameTF.text = ""
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }

}

