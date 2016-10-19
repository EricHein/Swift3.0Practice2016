//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Eric H on 15/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var toDoTable: UITableView!
    
    var items:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemsObject = UserDefaults.standard.object(forKey: Constants.persistentArray.kPersistentArray)
        
        if let tempItems = itemsObject as? [String]{
            
            items = tempItems
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let itemsObject = UserDefaults.standard.object(forKey: Constants.persistentArray.kPersistentArray)
        
        if let tempItems = itemsObject as? [String]{
            
            items = tempItems
        }
        
        toDoTable.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
      
        cell.textLabel?.text = items[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            
            items.remove(at: indexPath.row)
            toDoTable.reloadData()
            UserDefaults.standard.set(items, forKey: Constants.persistentArray.kPersistentArray)
            
        }
    }


}

