//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let errorMessage = error {
                    self.showErrorPopUp(errorMessage)
                } else {
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
    
    func showErrorPopUp(_ errorMessage: Error) {
        let alert = UIAlertController(title: "Error", message: errorMessage.localizedDescription, preferredStyle: .alert)
        
        //define action
        let alertAction = UIAlertAction(title: "Okay", style: .default) {(action) in
            print(action)
        }
        
        //add action to alert
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}
