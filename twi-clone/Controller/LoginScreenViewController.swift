//
//  LoginScreenViewController.swift
//  twi-clone
//
//  Created by Kiril Malenchik on 26.03.21.
//

import UIKit
import FirebaseAuth

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
    
    func validateFields() -> String? {
        
        if  loginField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
            {
            return "Please fill in all fields"
        }
        return nil
    }
    
    func showErrorMessage(_ errorMessage: String) {
        errorLoginLabel.text = errorMessage
        errorLoginLabel.alpha = 1
    }
    
    func transitionToHomeScreen(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? UINavigationController

        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }


    @IBAction func loginButtonTapped(_ sender: Any) {
        
        // Check fields validate
        let error = validateFields()
        
        if error != nil {
            //Show the error message
            showErrorMessage(error!)
        }
        
        //Login user
        else {
            
            let email = loginField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                
                // check errors
                if let error = error {
                    self.showErrorMessage("Error login user")
                    print(error)
                } else {
                    
                    self.transitionToHomeScreen()
                    
                }
            }
            
        }
        
        
    }

}
