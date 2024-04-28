//
//  UIView+Extension.swift
//  Calculator
//
//  Created by Rahul K on 09/11/23.
//

import UIKit

extension UIView {
    //? How to create drop box kind of inspectable option to choose all,top, bottom side of masked corners
//    @IBInspectable var maskCorners: CornerMaskType {
//        set {
//            
//        }
//        get {
//            
//        }
//    }
    
    //? How to display this change directly on storyboard
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            self.clipsToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
}
