//
//  RoundedTextField.swift
//  Swap-design
//
//  Created by Marcin Warno on 02/04/2019.
//  Copyright © 2019 Marcin Warno. All rights reserved.
//

import UIKit

class RoundedTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
}

private extension RoundedTextField {
    func setupView() {
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
    }
}

