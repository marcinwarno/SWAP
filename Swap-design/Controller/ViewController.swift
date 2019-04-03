//
//  LoginViewController.swift
//  Swap-design
//
//  Created by Julek on 01/04/2019.
//  Copyright © 2019 Marcin Warno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var linksContainer: UIView!
    @IBOutlet weak var qrCodeContainer: UIView!
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
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
    }

}
