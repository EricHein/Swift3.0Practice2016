//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Eric H on 24/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("eric", forKey: "username")
        newUser.setValue("qwerty", forKey: "password")
        newUser.setValue(5, forKey: "age")
        
        do{
            try context.save()
            
            print("Saved")
            
        }catch{
            print("Error")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.predicate = NSPredicate(format: "name == %@", "eric")
        //request.predicate = NSPredicate(format: "age < %@", "10")
        
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(request)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let username = result.value(forKey: "username") as? String{
                        /*
                        context.delete(result)
                        
                        do{
                            try context.save()
                            
                        }catch{
                            
                            print("Error")
                        }
                        
                        
                        result.setValue("Dooly", forKey: "username")
                        
                        do{
                            try context.save()
                            
                        }catch{
                            
                            print("Error")
                        }
                    
                    */
                        
                        print(username)
                }
            }
                
            
            }else{
                
                print("No Results")
            }
            
            
        }catch{
            print("Cannot Fetch")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

