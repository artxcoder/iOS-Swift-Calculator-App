//
//  CollectionViewCell+Extension.swift
//  Calculator
//
//  Created by Rahul K on 08/11/23.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
}
