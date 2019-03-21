//
//  LinkingViewController.swift
//  SWAP
//
//  Created by Dorota Bryk on 05.01.2019.
//  Copyright © 2019 Marcin Warno. All rights reserved.
//

import UIKit
import Firebase

class LinkingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var snapchatNick: UITextField!
    @IBOutlet weak var instagramNick: UITextField!
    
    @IBAction func snapchatLink(_ sender: UIButton) {
        
        snapchatNick.endEditing(true)
        
        snapchatNick.isEnabled = false
        
        let userID = Auth.auth().currentUser?.uid
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("users").child(userID!).updateChildValues(["Snapchat-nick":snapchatNick.text!])
        
        snapchatNick.text = ""
        snapchatNick.isEnabled = true
        
    }
    
    @IBAction func instagramLink(_ sender: Any) {
        
        instagramNick.endEditing(true)
        
        instagramNick.isEnabled = false
        
        let userID = Auth.auth().currentUser?.uid
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("users").child(userID!).updateChildValues(["Instagram-nick":instagramNick.text!])
        
        instagramNick.text = ""
        instagramNick.isEnabled = true
        
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
