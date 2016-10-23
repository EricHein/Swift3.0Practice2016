//
//  VC2.swift
//  AdvancedSegues
//
//  Created by Eric H on 22/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class VC2: UIViewController {
    
    var activeRow = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(activeRow)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "VC1Segue"{
            let firstVC = segue.destination as! ViewController
            
            firstVC.userName = "NotEric"
        }
    }
 

}
