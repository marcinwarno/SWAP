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
    


    @IBAction func Button(_ sender: Any) {
        
        if let text = TextField.text
        {
            let image = generateQRCode(from: text)
            ImageView.image = image
            
        }
        
    }
    
    
    
    
    
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
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = generateQRCode(from: "Welcome to SWAP")
        ImageView.image = image
    }


}

