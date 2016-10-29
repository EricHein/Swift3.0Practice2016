//
//  ViewController.swift
//  LoginDemo
//
//  Created by Eric H on 28/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var tf: UITextField!
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    @IBOutlet var logoutButton: UIButton!
    var isLoggedIn = false
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        logoutButton.alpha = 0
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject]{
                if let username = result.value(forKey: "name") as? String{
                    tf.alpha = 0
                    button.setTitle("Update name", for: [])
                    label.alpha = 1
                    label.text = "Hi there " + username + "!"
                    
                    isLoggedIn = true
                }
            }
        }catch{
            print("Failed to Save")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonTapped(_ sender: AnyObject) {
        let context = appDelegate.persistentContainer.viewContext
        
        if isLoggedIn {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            do{
                let results = try context.fetch(request)
                if results.count > 0{
                    for result in results as! [NSManagedObject]{
                        result.setValue(tf.text, forKey: "name")
                        
                        do{
                            try context.save()
                        }catch{
                            print("username change save failed")
                        }
                    }
                    label.text = "Hi there " + tf.text! + "!"
                }
            }catch{
                print("Update user name failed")
            }
        }else{
            let newValue = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            newValue.setValue(tf.text, forKey: "name")
            do{
                try context.save()
                
                button.setTitle("Update username", for: [])
                tf.alpha = 0
                button.alpha = 0
                label.alpha = 1
                label.text = "Hi there " + tf.text! + "!"
                
                
            }catch{
                print("Failed to Save")
            }
        }
        
    }

    @IBAction func logoutButtonTapped(_ sender: AnyObject) {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do{
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject]{
                    
                    context.delete(result)
                    
                    do{
                        try context.save()
                    }catch{
                        
                        print("")
                    }
                }
                isLoggedIn = false
                label.alpha = 0
                logoutButton.alpha = 0
                tf.alpha = 0
                button.alpha = 0
                
            }
        }catch{
            print("Delete Failed")
        }
        
    }
}

