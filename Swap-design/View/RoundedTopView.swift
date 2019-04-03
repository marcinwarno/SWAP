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
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 30
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 10)
        
        
    }
}

