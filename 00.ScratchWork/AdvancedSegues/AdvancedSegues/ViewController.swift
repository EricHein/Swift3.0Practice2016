//
//  ViewController.swift
//  AdvancedSegues
//
//  Created by Eric H on 22/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

let globalVariable = "Eric"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userName = "Eric"
    
    var activeRow = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return 4
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "Row = \(indexPath.row)"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "VC2Segue", sender: nil)
        
        activeRow = indexPath.row
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "VC2Segue"{
            let secondVC = segue.destination as! VC2
            
            secondVC.activeRow = activeRow
            
        }
    }
    


}

