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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextfield.text! , password: passwordTextfield.text! ) { (user, error) in
            if error != nil{
                print(error!)
            } else{
                print("Succes registration")
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
