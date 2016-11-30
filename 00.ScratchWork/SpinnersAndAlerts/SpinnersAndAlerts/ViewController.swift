//
//  ViewController.swift
//  SpinnersAndAlerts
//
//  Created by Eric H on 30/11/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activityIndicatior = UIActivityIndicatorView ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alertButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController (title: "Test", message: "TestMessage", preferredStyle: UIAlertControllerStyle.alert)
        
        
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
            print("Ok button pressed")
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: { (action) in
            print(" No button pressed")
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }

    @IBAction func pauseAppTapped(_ sender: Any) {
        activityIndicatior = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        activityIndicatior.center = self.view.center
        
        activityIndicatior.hidesWhenStopped = true
        activityIndicatior.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        
        view.addSubview(activityIndicatior)
        
        activityIndicatior.startAnimating()
      
 
        
        //UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    @IBAction func restoreAppButtonTapped(_ sender: Any) {
        activityIndicatior.stopAnimating()
        //UIApplication.shared.endIgnoringInteractionEvents()
    }
}

