//
//  Enums.swift
//  Calculator
//
//  Created by Rahul K on 08/11/23.
//

import Foundation

enum ButtonType {
    case number, operand, allClear
}

enum KeyPadButton {
    case number(String)
    case operand(String)
    case allClear(String)
    case invalid
    
    init(title: String) {
        //! Check all other best methods
        switch title.lowercased() {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            self = .number(title)
        case "+", "-", "x", "/", "=":
            self = .operand(title)
        case "ac":
            self = .allClear(title.uppercased())
        default:
            self = .invalid
        }
    }
}

//For IBInspectables, to set masked corners
enum CornerMaskType {
    case all, topLeftRight
}
