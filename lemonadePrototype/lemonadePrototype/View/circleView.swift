//
//  circleView.swift
//  lemonadePrototype
//
//  Created by Justin Young on 7/30/18.
//  Copyright © 2018 Justin Young. All rights reserved.
//

import UIKit

class circleView: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
