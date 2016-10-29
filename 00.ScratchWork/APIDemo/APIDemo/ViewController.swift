//
//  ViewController.swift
//  APIDemo
//
//  Created by Eric H on 29/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var cityTF: UITextField!
    @IBOutlet var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + cityTF.text!.replacingOccurrences(of: " ", with: "%20") + ",uk&appid=08e64df2d3f3bc0822de1f0fc22fcb2d") {
            
            let task = URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                
                if error != nil{
                    print(error)
                }else{
                    if let urlContent = data{
                        
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                            print(jsonResult)
                            
                            
                            if let description = ((jsonResult["weather"] as? NSArray)? [0] as? NSDictionary)?["description"] as? String {
                                
                                DispatchQueue.main.sync (execute:{
                                    self.resultLabel.text = description
                                })
                                
                                print(description)
                                
                            }
                        }catch{
                            
                            print("Failed")
                        }
                        
                        
                    }
                }
                
            }
            task.resume()
        }else{
            resultLabel.text = "Couldn't find the weather for that city"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func submitButtonTapped(_ sender: AnyObject) {
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=08e64df2d3f3bc0822de1f0fc22fcb2d")!
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            if error != nil{
                print(error)
            }else{
                if let urlContent = data{
                    
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print(jsonResult)
                        
                        
                        if let description = ((jsonResult["weather"] as? NSArray)? [0] as? NSDictionary)?["description"] as? String {
                            
                            DispatchQueue.main.sync (execute:{
                                self.resultLabel.text = description
                            })
                            
                            print(description)
                            
                        }
                    }catch{
                        
                        print("Failed")
                    }
                    
                    
                }
            }
            
        }
        task.resume()
    }

}

