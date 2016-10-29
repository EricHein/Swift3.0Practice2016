//
//  ViewController.swift
//  DownloadingImages
//
//  Created by Eric H on 29/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if documentsPath.count > 0 {
            let documentsDirectory = documentsPath[0]
            let restorePath = documentsDirectory + "/wiki.jpg"
            imageView.image = UIImage(contentsOfFile: restorePath)
        }
        
        
        /*
        let url = URL(string:"https://en.wikipedia.org/wiki/File:Dore-munchausen-illustration.jpg")!
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil{
                print(error)
    
            }else{
                if let data = data{
                    
                    if let wikiImage = UIImage(data: data){
                        self.imageView.image = wikiImage
                        
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                        
                        if documentsPath.count > 0 {
                            let documentsDirectory = documentsPath[0]
                            let savePath = documentsDirectory + "/wiki.jpg"
                            
                            do{
                                try UIImageJPEGRepresentation(wikiImage, 1.0)?.write(to: URL(fileURLWithPath: savePath))
                            }catch{
                                // process error
                            }
                            
                            
                        }
                    }
                }
            }
            
        }
        task.resume()
 */
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

