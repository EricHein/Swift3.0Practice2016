//
//  ViewController.swift
//  DownloadingWebContent
//
//  Created by Eric H on 15/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let urlStack = URL(string: "https://www.google.com")!
        //webView.loadRequest(URLRequest(url: urlStack))
        
        //webView.loadHTMLString("<h1>Hello there!</h1>", baseURL: nil)
        
        if let url1 = URL(string: "https://stackoverflow.com"){
            
            let request = NSMutableURLRequest(url: url1)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                
                if error != nil{
                    print(error)
                }else{
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString)
                        
                    }
                }
                
                
            }
            
            task.resume()
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

