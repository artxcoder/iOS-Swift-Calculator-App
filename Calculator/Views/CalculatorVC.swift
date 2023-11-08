//
//  CalculatorVC.swift
//  Calculator
//
//  Created by Rahul K on 08/11/23.
//

import UIKit

class CalculatorVC: UIViewController {
    
    @IBOutlet weak var keypadCV: UICollectionView!
    
    lazy var keyPadButtons: [KeyPadButton] = [
        KeyPadButton(title: "7"),KeyPadButton(title: "8"),KeyPadButton(title: "9"), KeyPadButton(title: "x"),
        KeyPadButton(title: "4"), KeyPadButton(title: "5"), KeyPadButton(title: "6"), KeyPadButton(title: "/"),
        KeyPadButton(title: "1"), KeyPadButton(title: "2"), KeyPadButton(title: "3"), KeyPadButton(title: "-"),
        KeyPadButton(title: "ac"), KeyPadButton(title: "0"), KeyPadButton(title: "="), KeyPadButton(title: "x")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCV()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        keypadCV.reloadData()
    }
    
    func configCV() {
        
        keypadCV.delegate = self
        keypadCV.dataSource = self
        keypadCV.register(ButtonCollectionViewCell.self, forCellWithReuseIdentifier: "ButtonCollectionViewCell")
        keypadCV.reloadData()
    }
}

extension CalculatorVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonCollectionViewCell", for: indexPath) as! ButtonCollectionViewCell
        let keyPadButton = keyPadButtons[indexPath.row]
        cell.backgroundColor = .green
        //cell.loadButton(type: keyPadButton)
        return cell
    }
}

extension CalculatorVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //? bounds vs frame
        return CGSize(width: collectionView.bounds.size.width / 5, height: collectionView.bounds.size.width / 5)
    }
}
