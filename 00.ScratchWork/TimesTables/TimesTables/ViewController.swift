//
//  ViewController.swift
//  TimesTables
//
//  Created by Eric H on 14/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var table: UITableView!
    
    @IBOutlet var slider: UISlider!
    
    @IBAction func sliderDidChange(_ sender: AnyObject) {
        print(slider.value)
        table.reloadData()
        
        sliderLabel.text = " \(Int(slider.value * 20)) Times Tables"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderLabel.text = " \(Int(slider.value * 20)) Times Tables"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        let a = String(indexPath.row + 1)
        let b = String((indexPath.row + 1) * Int(slider.value * 20))
            
        
        cell.textLabel?.text =  "x" + a + " = " + b
        
        
        
        return cell
    }
    


}














