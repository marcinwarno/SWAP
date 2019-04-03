//
//  LoginViewController.swift
//  Swap-design
//
//  Created by Julek on 01/04/2019.
//  Copyright © 2019 Marcin Warno. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var linksContainer: UIView!
    @IBOutlet weak var qrCodeContainer: UIView!
    let currentUserId = Auth.auth().currentUser?.uid
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
//        qrCodeContainer.layer.cornerRadius = 10
        qrCodeContainer.layer.shadowColor = UIColor.black.cgColor
        qrCodeContainer.layer.shadowRadius = 30
        qrCodeContainer.layer.shadowOpacity = 0.1
        qrCodeContainer.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        qrCodeContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        qrCodeContainer.layer.cornerRadius = 20
        qrCodeContainer.layer.masksToBounds = true
        
        
//        linksContainer.layer.cornerRadius = 10
        linksContainer.layer.shadowColor = UIColor.black.cgColor
        linksContainer.layer.shadowRadius = 30
        linksContainer.layer.shadowOpacity = 0.1
        linksContainer.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        
        linksContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        linksContainer.layer.cornerRadius = 20
        linksContainer.layer.masksToBounds = true
        imageView.image = generateQRCode(from: "http://swap.com.pl/users.html?\(currentUserId!)")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func generateQRCode(from string: String) -> UIImage? {
    let data = string.data(using: String.Encoding.ascii)
    
    if let filter = CIFilter(name: "CIQRCodeGenerator") {
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        
        if let output = filter.outputImage?.transformed(by: transform) {
            return UIImage(ciImage: output)
        }
    }
        
        return nil
    }
    
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
    }

}
