/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    
    var signupMode = true
    var activityIndicator = UIActivityIndicatorView()

    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if PFUser.current() != nil{
            
            self.performSegue(withIdentifier: "showUserTable", sender: self)
        }
        
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action) in
            
            self.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        //Signup or Login
        
        if emailTF.text == "" || passwordTF.text == ""{
            createAlert(title: "Error", message: "Please enter your email and password")
        }else{
            
            
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.shared.beginIgnoringInteractionEvents()
            
            if signupMode {
                //Sign up
                
                let user = PFUser()
                
                user.username = emailTF.text
                user.email = emailTF.text
                user.password = passwordTF.text
                
                user.signUpInBackground(block: { (success, error) in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if error != nil{
                        var displayErrorMessage = "Please try again later."
                        
                        if let errorMessage = (error! as NSError).userInfo["error"]  as? String {
                            displayErrorMessage = errorMessage
                        }
                        self.createAlert(title: "Sign Up Error", message: displayErrorMessage)
                    }else{
                        print("User Signed Up")
                        self.performSegue(withIdentifier: "showUserTable", sender: self)
                    }
                    
                })
                
            }else{
                //Login mode
                
                PFUser.logInWithUsername(inBackground: emailTF.text!, password: passwordTF.text!, block: { (user, error) in
                    
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if  error != nil {
                        var displayErrorMessage = "Please try again later."
                        
                        if let errorMessage = (error! as NSError).userInfo["error"]  as? String {
                            displayErrorMessage = errorMessage
                        }
                        self.createAlert(title: "Login Error", message: displayErrorMessage)
                        
                    }else{
                        print("Logged In")
                        self.performSegue(withIdentifier: "showUserTable", sender: self)
                    }
                    
                    
                })
            }
        }
   
        
    }
    
    //Change Mode
    @IBAction func loginButtonTapped(_ sender: Any) {
        //Change to Login View
        
        if signupMode {
            //change to login mode
            signUpButton.setTitle("Login", for: [])
            loginButton.setTitle("Sign Up", for: [])
            messageLabel.text = "Don't have an account?"
            
            signupMode = false
        }else{
            
            signUpButton.setTitle("Sign Up", for: [])
            loginButton.setTitle("Login", for: [])
            messageLabel.text = "Already have an account?"
            
            signupMode = true
        }
    }
    
    
    
}
