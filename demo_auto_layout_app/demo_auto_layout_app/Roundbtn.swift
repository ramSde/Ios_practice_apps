//
//  Roundbtn.swift
//  demo_auto_layout_app
//
//  Created by Zignuts Tchnolab on 15/02/24.
//

import UIKit
@IBDesignable
class Roundbtn: UIButton {

    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }

}
