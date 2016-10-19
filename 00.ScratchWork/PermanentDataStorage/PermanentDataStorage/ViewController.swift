//
//  ViewController.swift
//  PermanentDataStorage
//
//  Created by Eric H on 14/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UserDefaults.standard.set("Eric", forKey:"name")
        
        let nameObject = UserDefaults.standard.object(forKey: "name")
        
        if let name = nameObject as? String{
            
            print(name)
        }
        
        
        //let array = [1,2,3,4,5]
        
        //UserDefaults.standard.set(array, forKey: "array")
        
        let arrayObjects = UserDefaults.standard.object(forKey: "array")
        
        
        if let arr = arrayObjects as? NSArray {
            
            print(arr)
        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }


}

