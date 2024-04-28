//
//  CollectionViewCell+Extension.swift
//  Calculator
//
//  Created by Rahul K on 08/11/23.
//

import UIKit

extension UICollectionViewCell {
    static var nib: UINib {
        get {
            return UINib(nibName: self.identifier, bundle: nil)
        }
    }
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
}
