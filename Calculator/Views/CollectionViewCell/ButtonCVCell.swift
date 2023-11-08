//
//  ButtonCVCell.swift
//  Calculator
//
//  Created by Rahul K on 08/11/23.
//

/*
    ButtonCVCell is the collection view cell to display buttons
    with '0-9' and operands {=,+,/.x,-}
    with respective colour and action
 */

import UIKit

class ButtonCVCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var title: String
    var type: ButtonType
    
    init?(title: String, type: ButtonType) {
        self.title = title
        self.type = type
        super.init(coder: NSCoder())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadButton(withTitle title: String, andType buttonType: ButtonType) {
        lblTitle.text = title
        
        var lblTintColor: UIColor!
        
        switch buttonType {
        case .allClear:
            lblTintColor = .tint_fontRed
        case .number:
            lblTintColor = .tint_fontWhite
        case .operand:
            lblTintColor = .tint_fontRed
        }
        
        lblTitle.textColor = lblTintColor
    }
}
