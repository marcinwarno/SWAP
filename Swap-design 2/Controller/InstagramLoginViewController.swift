//
//  InstagramLoginViewController.swift
//  SWAPFB
//
//  Created by Julek on 26/03/2019.
//  Copyright © 2019 Juliusz Kotruchow. All rights reserved.
//

import UIKit
import Firebase

class InstagramLoginViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var webView: UIWebView!
    var databaseReference : DatabaseReference!
    var databaseHandle : DatabaseHandle!
    var InstagramUserName : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        login()
    }
    
    
    func login(){
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [INSTAGRAM_IDS.INSTAGRAM_AUTHURL,INSTAGRAM_IDS.INSTAGRAM_CLIENT_ID,INSTAGRAM_IDS.INSTAGRAM_REDIRECT_URI, INSTAGRAM_IDS.INSTAGRAM_SCOPE])
        let urlRequest = URLRequest.init(url: URL.init(string: authURL)!)
        webView.loadRequest(urlRequest)
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request:URLRequest, navigationType: UIWebView.NavigationType) -> Bool{
        return checkRequestForCallbackURL(request: request)
    }
    
    func checkRequestForCallbackURL(request: URLRequest) -> Bool {
        let requestURLString = (request.url?.absoluteString)! as String
        
        if requestURLString.hasPrefix(INSTAGRAM_IDS.INSTAGRAM_REDIRECT_URI) {
            let range: Range<String.Index> = requestURLString.range(of: "#access_token=")!
            handleAuth(authToken: requestURLString.substring(from: range.upperBound))
            return false;
        }
        
        return true
    }
    func handleAuth(authToken: String) {
        print("Instagram authentication token == \(authToken)")
        self.navigationController?.popViewController(animated: true)
        let url = String(format: "https://api.instagram.com/v1/users/self/?access_token=%@", authToken)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: URL(string: url)!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        session.dataTask(with: request as URLRequest){ (data, response, error) -> Void in
            
            if error != nil {
                print(error!)
            }
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                let instagramUsername = (json?.value(forKey: "data") as AnyObject).value(forKey: "username") as? String
                
                self.InstagramUserName = instagramUsername!
                self.addUserToDatabase()
            }
        }.resume()
        
        
        
    }
    
    func addUserToDatabase(){
        databaseReference = Database.database().reference()
        let currentUserID = Auth.auth().currentUser?.uid
        
        let userData = [
            "InstagramProfile":  "https://www.instagram.com/\(self.InstagramUserName)"
        ]
        databaseReference.child("user").child((currentUserID)!).updateChildValues(userData)
        
        comeBackToUserProfile()
    }
    
    func comeBackToUserProfile(){
        self.performSegue(withIdentifier: "comeBackToLinksViewController", sender: self)
    }

}
