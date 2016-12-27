//
//  PostViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Eric H on 22/12/2016.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

class PostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var activityIndicator = UIActivityIndicatorView()
    @IBOutlet var imageToPost: UIImageView!
    @IBOutlet var messageTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func chooseAnImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate  = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            imageToPost.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func postImageButtonTapped(_ sender: Any) {
        
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        var post = PFObject(className: "Posts")
        
        post["message"] = messageTF.text
        post["userID"] = PFUser.current()?.objectId!
        
        let imageData = UIImagePNGRepresentation(imageToPost.image!)
        let imageFile = PFFile(name: "image.png", data: imageData!)
        
        post["imageFile"]=imageFile
        
        post.saveInBackground{ (success, error) in
            
            self.activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            if error != nil{
                self.createAlert(title: "Error Posting Image", message: "Please try again later.")
            }else{
                self.createAlert(title: "Image Posted", message: "")
                
                self.messageTF.text = ""
                self.imageToPost.image = UIImage(named: "defaultUserIcon3.png")
            }
            
        }
    }
    
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
