//
//  RoundedTopView.swift
//  Swap-design
//
//  Created by Marcin Warno on 29/03/2019.
//  Copyright © 2019 Marcin Warno. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedTopView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
}

private extension RoundedTopView {
    func setupView() {
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
}

