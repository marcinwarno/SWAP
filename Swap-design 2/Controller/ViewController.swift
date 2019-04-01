//
//  ViewController.swift
//  Swap-design
//
//  Created by Marcin Warno on 28/03/2019.
//  Copyright © 2019 Marcin Warno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var qrCodeContainer: UIView!
    @IBOutlet weak var linksContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.isNavigationBarHidden = true
        qrCodeContainer.layer.cornerRadius = 10
        qrCodeContainer.layer.shadowColor = UIColor.black.cgColor
        qrCodeContainer.layer.shadowRadius = 30
        qrCodeContainer.layer.shadowOpacity = 0.1
        qrCodeContainer.layer.shadowOffset = CGSize(width: 0, height: 10)
        
        
        linksContainer.layer.cornerRadius = 10
//        LinksContainer.layer.shadowColor = UIColor.black.cgColor
//        LinksContainer.layer.shadowRadius = 30
//        LinksContainer.layer.shadowOpacity = 0.1
//        LinksContainer.layer.shadowOffset = CGSize(width: 0, height: 10)
        
    }

    @IBAction func justClose(segue: UIStoryboardSegue) {
        //
    }
    
    
}

