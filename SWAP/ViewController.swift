//
//  ViewController.swift
//  SWAP
//
//  Created by Marcin Warno on 02/12/2018.
//  Copyright © 2018 Marcin Warno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextField: UITextField!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var OtherUsername: UITextField!
    
    var nick = ""
    var link = "https://swapapp.com/"

    
    @IBAction func SnapchatButtonPressed(_ sender: Any) {
        
        let otherUsername = OtherUsername.text!
        
        
    }
    
    @IBAction func InstagramButtonPressed(_ sender: Any) {
    }
    
    
    
//
//    @IBAction func Button(_ sender: Any) {
//        link += nick
//
//        let image = generateQRCode(from: link)
//
//        ImageView.image = image
//
//
//    }
//    
//
//    func generateQRCode(from string: String) -> UIImage? {
//        let data = string.data(using: String.Encoding.ascii)
//
//        if let filter = CIFilter(name: "CIQRCodeGenerator") {
//            filter.setValue(data, forKey: "inputMessage")
//            let transform = CGAffineTransform(scaleX: 10, y: 10)
//
//            if let output = filter.outputImage?.transformed(by: transform) {
//                return UIImage(ciImage: output)
//            }
//        }
//
//        return nil
//    }
//
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let image = generateQRCode(from: "Welcome to SWAP")
//        ImageView.image = image
    }


}

