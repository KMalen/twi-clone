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
        setUpTextFieldsTagAndDelegates()
        
        initializeHideKeyboard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func setUpStyleElements(){
        Utilities.styleFilledButton(loginButton)
        Utilities.styleTextField(loginField)
        Utilities.styleTextField(passwordField)
        
        //Hide the error label
        errorLoginLabel.alpha = 0
    }
    
    func setUpTextFieldsTagAndDelegates(){
        loginField.delegate = self
        passwordField.delegate = self
        
        loginField.tag = 1
        passwordField.tag = 2
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
        let homeNavigationController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? UINavigationController
        //        let homeViewController = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeViewController
        
        homeNavigationController?.modalPresentationStyle = .fullScreen
        self.present(homeNavigationController!, animated: true, completion: nil)
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

extension LoginScreenViewController: UITextFieldDelegate {
    
    func initializeHideKeyboard(){
        //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        //Add this tap gesture recognizer to the parent view
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
        //In short- Dismiss the active keyboard.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Check if there is any other text-field in the view whose tag is +1 greater than the current text-field on which the return key was pressed. If yes → then move the cursor to that next text-field. If No → Dismiss the keyboard
        if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
}
