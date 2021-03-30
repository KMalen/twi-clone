//
//  SignUpViewController.swift
//  twi-clone
//
//  Created by Kiril Malenchik on 30.03.21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpStyleElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpStyleElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        // Hide the error label
        errorLabel.alpha = 0
    }
    
    
    @IBAction func singUpButtonTapped(_ sender: Any) {
    }
    
}
