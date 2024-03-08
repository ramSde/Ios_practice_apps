//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    

    @IBAction func loginPressed(_ sender: UIButton) {
        emailTextfield.endEditing(true)
        passwordTextfield.endEditing(true)
        if let email = emailTextfield.text ,let password = passwordTextfield.text{
            Auth.auth().signIn(withEmail: email, password: password){
                authresponse,error in
                if  let er = error {
               
                    print(er)
                }
                else{
                    self.performSegue(withIdentifier: constants.loginSegue, sender: nil)
                }
            }
        }
      
    }
    
}
