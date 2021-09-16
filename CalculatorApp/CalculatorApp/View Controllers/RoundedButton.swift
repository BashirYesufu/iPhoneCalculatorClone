//
//  RoundedButton.swift
//  CalculatorApp
//
//  Created by mac on 7/18/21.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
