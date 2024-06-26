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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadButton(type: KeyPadButton) {
        var lblTitleText: String?
        var lblTintColor: UIColor?
        
        switch type {
        case .allClear(let title):
            lblTitleText = title
            lblTintColor = .tint_fontGreen
        case .number(let title):
            lblTitleText = title
            lblTintColor = .tint_fontWhite
        case .operand(let title):
            lblTitleText = title
            lblTintColor = .tint_fontRed
        case .invalid:
            lblTitleText = nil
            lblTintColor = nil
        }
        //showing as nil when nib file was not loaded
        //only class was loaded and not nib
        //everything is modular
        //register cell is used to connect both
        lblTitle.text = lblTitleText ?? kCalAlertText.invalidValue
        lblTitle.textColor = lblTintColor ?? .alert_invalid
    }
}
