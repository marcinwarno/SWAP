//
//  ViewController.swift
//  SWAPFB
//
//  Created by Julek on 22/03/2019.
//  Copyright © 2019 Juliusz Kotruchow. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    var databaseReference : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    var FbName : String = ""
    var FbEmail : String = ""
    var FbLink : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //chekIfUserIsLoggedInWithFacebook()
    }
    
    

    @IBAction func continueWithFacebookButtonTapped(_ sender: Any) {
        let LoginManager = FBSDKLoginManager()
        LoginManager.logIn(withReadPermissions: ["public_profile", "email", "user_link"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            guard FBSDKAccessToken.current() != nil else {
                print("Failed to get access token")
                return
            }
            
            self.chekIfUserIsLoggedInWithFacebook()
        }
    }
    
   
    
    func fetchProfile(){
        let parameters = ["fields": "name, email, link, id"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters)?.start(completionHandler: { (connection, result, error) in
            if error != nil{
                print(error!)
                return
            }
            
            if let fbemail = (result as AnyObject)["email"]! as? String
            {
                self.FbEmail = fbemail
            }
            if let fbname = (result as AnyObject)["name"]! as? String
            {
                self.FbName = fbname
            }
            if let fblink = (result as AnyObject)["link"]! as? String
            {
                self.FbLink = fblink
            }
            
            self.addUserToDatabase()
            
        })
    }
    
    func chekIfUserIsLoggedInWithFacebook(){
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                print("Login error: \(error.localizedDescription)")
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                return
            }
            else{
                
                self.fetchProfile()
                self.performSegue(withIdentifier: "showUserProfile", sender: self)
            }
        }
    }
    
    func addUserToDatabase(){
        //Create reference to Firebase database
        databaseReference = Database.database().reference()
        
        //Fetch current user id
        let currentUserID = Auth.auth().currentUser?.uid
        
        //Get data from facebook and save it to database
        let userData = [
            "Name":  self.FbName,
            "Email": self.FbEmail,
            "UserProfile": self.FbLink
        ]
        
        //Check if user has been already in database
        databaseReference.child("user").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.hasChild(currentUserID!){
                //Do nothing
                print("User is already in database")
            }
            else{
                //Ad user to databse
                self.databaseReference.child("user").child((currentUserID)!).setValue(userData)
            }
        })
    }
    
}

