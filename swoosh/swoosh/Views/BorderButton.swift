//
//  BorderButton.swift
//  swoosh
//
//  Created by Young, Justin on 5/23/18.
//  Copyright © 2018 Young, Justin. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
        
    }
    
}
