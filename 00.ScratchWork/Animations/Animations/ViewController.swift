//
//  ViewController.swift
//  Animations
//
//  Created by Eric H on 16/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    var counter = 0
    
    let animationImagesArray:[UIImage] = [UIImage(named: "0000.png")!,UIImage(named: "0001.png")!,UIImage(named: "0002.png")!,UIImage(named: "0003.png")!,UIImage(named: "0004.png")!,UIImage(named: "0005.png")!,UIImage(named: "0006.png")!,UIImage(named: "0007.png")!,UIImage(named: "0008.png")!,UIImage(named: "0009.png")!,UIImage(named: "0010.png")!,UIImage(named: "0011.png")!,UIImage(named: "0012.png")!,UIImage(named: "0013.png")!,UIImage(named: "0014.png")!,UIImage(named: "0015.png")!,UIImage(named: "0016.png")!,UIImage(named: "0017.png")!,UIImage(named: "0018.png")!,UIImage(named: "0019.png")!,UIImage(named: "0020.png")!]

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.animationImages = animationImagesArray
        imageView.animationDuration = 4.0
        imageView.animationRepeatCount = 0
        
        nextButton.setTitle("Start", for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        if  nextButton.titleLabel?.text == "Start"{
            
            nextButton.setTitle("Stop", for: UIControlState.normal)
            imageView.startAnimating()
            
        }else{
            
            nextButton.setTitle("Start", for: UIControlState.normal)
            imageView.stopAnimating()
        }
        
        
        
        /*
        if counter <= 9 {
            imageView.image = UIImage(named: "000\(counter).png")
            counter += 1
        }else{
            
            imageView.image = UIImage(named: "00\(counter).png")
            counter += 1
            
            if counter == 20{
                counter = 0
            }
        }
 */
        
       
    }
    @IBAction func fadeInButtonTapped(_ sender: UIButton) {
        imageView.alpha = 0
        UIView.animate(withDuration: 2, animations: {
            self.imageView.alpha = 1
        })
    }
    @IBAction func slideInButtonTapped(_ sender: UIButton) {
        imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
        
        UIView.animate(withDuration: 2, animations: {
            self.imageView.center = CGPoint(x: self.imageView.center.x + 500, y: self.imageView.center.y)
        })
    }
    @IBAction func growButtonTapped(_ sender: UIButton) {
        imageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 2, animations: {
            self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        })
    }
    
}















