//
//  Utilities.swift
//  twi-clone
//
//  Created by Kiril Malenchik on 30.03.21.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textField: UITextField){
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        bottomLine.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        
        // Remove border on text field
        textField.borderStyle = .none
        
        // Add the line to the text field
        textField.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button: UIButton){
        
        button.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        button.layer.cornerRadius = 15
        button.tintColor = UIColor.white
        
    }
    
    static func styleHollowButton(_ button: UIButton){
        
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 15
        button.tintColor = UIColor.black
        
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$")
        return passwordTest.evaluate(with: password)
        
    }
    
}
