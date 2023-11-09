//
//  CalculatorVC.swift
//  Calculator
//
//  Created by Rahul K on 08/11/23.
//

import UIKit

class CalculatorVC: UIViewController {
    
    @IBOutlet weak var lblOperator: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var keypadCV: UICollectionView!
    
    //CONSTANTS
    let kMinimumLineSpacing: CGFloat = 2
    let kMinimumItemSpacing:CGFloat = 2
    let kNumberOfItemsInRow = 4
    let kNumberOfItemsInColumn = 4
    
    lazy var keyPadButtons: [KeyPadButton] = [
        KeyPadButton(title: "7"),KeyPadButton(title: "8"),KeyPadButton(title: "9"), KeyPadButton(title: "x"),
        KeyPadButton(title: "4"), KeyPadButton(title: "5"), KeyPadButton(title: "6"), KeyPadButton(title: "/"),
        KeyPadButton(title: "1"), KeyPadButton(title: "2"), KeyPadButton(title: "3"), KeyPadButton(title: "-"),
        KeyPadButton(title: "ac"), KeyPadButton(title: "0"), KeyPadButton(title: "="), KeyPadButton(title: "+")
    ]
    
    //VARIABLES
    var num1: Int? {
        willSet {
            lblTotal.text = "\(newValue ?? 0)"
        }
    }
    var num2: Int? {
        willSet {
            lblTotal.text = "\(newValue ?? 0)"
        }
    }
    
    var currentOp: String? {
        willSet {
            lblOperator.text = newValue
        }
    }
    
    var error: CalError? {
        willSet {
            var alertText = "Error"
            switch newValue {
            case .divideByZero:
                alertText = "Can't Divide By Zero"
            case .unknown:
                break
            case .none:
                break
            }
            resetAllValues()
            lblTotal.text = alertText
        }
    }
//    var total: Int? {
//        willSet {
//            //? 'didSet' cannot be provided together with a getter, why can't i add get {} with will/didSet
//            //? why cant i convert String(newValue) here?
//            self.lblTotal.text = "\(newValue ?? 0)"
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customiseCV()
        configCV()
        resetAllValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keypadCV.reloadData()
    }
    
    func configCV() {
        
        keypadCV.delegate = self
        keypadCV.dataSource = self
        keypadCV.register(ButtonCVCell.nib, forCellWithReuseIdentifier: ButtonCVCell.identifier)
        keypadCV.reloadData()
    }
    
    func customiseCV() {
        keypadCV.backgroundColor = .clear
        let keypadCVFlowLayout = UICollectionViewFlowLayout()
        keypadCVFlowLayout.minimumLineSpacing = kMinimumLineSpacing
        keypadCVFlowLayout.minimumInteritemSpacing = kMinimumItemSpacing
        //this makes calling size for item delegate
        keypadCV.collectionViewLayout = keypadCVFlowLayout
    }
    
    func resetAllValues() {
        num1 = nil
        num2 = nil
        currentOp = nil
    }
    
    func calculate(num1: Int, num2: Int, op: String) -> Int? {
        switch op {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "x":
            return num1 * num2
        case "/":
            return num1 > 0 && num2 > 0 ? num1 / num2 : nil
        default:
            break
        }
        return nil
    }
}

extension CalculatorVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //keypad pressed
        let pressedKeyPadButton = keyPadButtons[indexPath.row]
        
        switch pressedKeyPadButton {
        case .number(let value):
            //convert value to integer for calculation
            if let valueInt = Int(value) {
                if currentOp == nil {
                    //no operation pressed
                    num1 = num1 == nil ? valueInt : String(num1!).count >= 8 ? num1 : (num1! * 10) + valueInt
                }
                else {
                    num2 = num2 == nil ? valueInt : String(num2!).count >= 8 ? num2 : (num2! * 10) + valueInt
                }
            }
        case .operand(let opValue):
            
            if let value1 = num1, let value2 = num2 {
                if let result = calculate(num1: value1, num2: value2, op: currentOp!) {
                    resetAllValues()
                    num1 = result
                }
                else {
                    //error result
                    error = .divideByZero
                    return
                }
            }
            else if num1 == nil && num2 == nil {
                //no values in num1 and num2
                num1 = 0
            }
            currentOp = opValue
            
        case .allClear(_):
            resetAllValues()
        default:
            break
        }
        
    }
    
    
}

extension CalculatorVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keyPadButtons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCVCell.identifier, for: indexPath) as! ButtonCVCell
        let keyPadButton = keyPadButtons[indexPath.row]
        cell.loadButton(type: keyPadButton)
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        return cell
    }
}

extension CalculatorVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //? bounds vs frame -> returns same value always
        let fullWidth = collectionView.bounds.size.width
        //4 items will have 3 space in between
        let itemSpacingWidth = CGFloat(kNumberOfItemsInRow - 1) * kMinimumItemSpacing
        let remainingWidthForItems = fullWidth - itemSpacingWidth
        let itemWidth = remainingWidthForItems / CGFloat(kNumberOfItemsInRow)
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
