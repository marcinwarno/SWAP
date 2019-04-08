//
//  SnapLoginController.swift
//  Swap-design
//
//  Created by Julek on 05/04/2019.
//  Copyright © 2019 Marcin Warno. All rights reserved.
//

import UIKit
import SCSDKLoginKit

class SnapLoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        SCSDKLoginClient.login(from: self, completion: { success, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if success {
                print("Login with Snapchat Succesfully")
                self.fetchSnapUserInfo()
                
            }
        })
    }
    
    private func fetchSnapUserInfo(){
        let graphQLQuery = "{me{displayName, bitmoji{avatar}}}"
        
        let variables = ["page": "bitmoji"]
        
        SCSDKLoginClient.fetchUserData(withQuery: graphQLQuery, variables: variables, success: { (resources: [AnyHashable: Any]?) in
            guard let resources = resources,
                let data = resources["data"] as? [String: Any],
                let me = data["me"] as? [String: Any] else { return }
            
            let displayName = me["displayName"] as? String
            print("Snapchat diaplayName is \(displayName!)")
            var bitmojiAvatarUrl: String?
            if let bitmoji = me["bitmoji"] as? [String: Any] {
                bitmojiAvatarUrl = bitmoji["avatar"] as? String
            }
        }, failure: { (error: Error?, isUserLoggedOut: Bool) in
            // handle error
        })
    }
    
}
