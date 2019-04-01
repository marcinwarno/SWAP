//
//  RoundedButton.swift
//  Swap-design
//
//  Created by Marcin Warno on 29/03/2019.
//  Copyright © 2019 Marcin Warno. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
}

private extension RoundedButton {
    func setupView() {
        layer.cornerRadius = frame.size.height / 2
        layer.masksToBounds = true
    }
}
