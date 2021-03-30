//
//  LoginScreenViewController.swift
//  twi-clone
//
//  Created by Kiril Malenchik on 26.03.21.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLoginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpStyleElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpStyleElements(){
        Utilities.styleFilledButton(loginButton)
        Utilities.styleTextField(loginField)
        Utilities.styleTextField(passwordField)
        //Hide the error label
        errorLoginLabel.alpha = 0
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
    }

}
