//
//  RegisterViewController.swift
//  SWAP
//
//  Created by Dorota Bryk on 05.01.2019.
//  Copyright © 2019 Marcin Warno. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextfield.text! , password: passwordTextfield.text! ) { (user, error) in
            
            if error != nil {
                print(error!)
            } else {
                print("Succes registration")
                let username = self.usernameTextField.text!
                let userID = Auth.auth().currentUser?.uid
                
                var ref: DatabaseReference!
                
                ref = Database.database().reference()
                
                ref.child("users").child(userID!).setValue(["Username": username, "Snapchat-nick" : "", "Instagram-nick": ""]) {
                    (error:Error?, ref:DatabaseReference) in
                    if let error = error {
                        print("Data could not be saved: \(error).")
                    } else {
                        print("Data saved successfully!")
                    }
                }
                self.performSegue(withIdentifier: "goToMenuRegister", sender: self)
            }
        }
        

        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
