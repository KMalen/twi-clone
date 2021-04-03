//
//  SignUpViewController.swift
//  twi-clone
//
//  Created by Kiril Malenchik on 30.03.21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
    
    func validateFields() -> String? {
        
        if  firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        
        // Check password secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !Utilities.isPasswordValid(cleanedPassword) {
            return "Please make your password stronger"
        }
        
        return nil
    }
    
    func showErrorMessage(_ errorMessage: String) {
        errorLabel.text = errorMessage
        errorLabel.alpha = 1
    }
    
    func transitionToHomeScreen(){
        let homeNavigationController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? UINavigationController
//        let homeViewController = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeViewController
        
        homeNavigationController?.modalPresentationStyle = .fullScreen
        self.present(homeNavigationController!, animated: true, completion: nil)
    }
    
    
    @IBAction func singUpButtonTapped(_ sender: Any) {
        
        //Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            //Show error message
            showErrorMessage(error!)
            
        }
        
        //Create the user
        else {
            
            //Create cleaned ver of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                
                //Check errors
                if let error = error {
                    self.showErrorMessage("Error creating user")
                    print(error)
                }
                else {
                    
                    //User was created, store names
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstName":firstName, "lastName":lastName, "uid":authResult!.user.uid]) { (error) in
                        
                        if error != nil {
                            self.showErrorMessage("User data couldn't add to Firestore")
                        }
                        
                        else {
                            //Go to home screen
                            self.transitionToHomeScreen()
                        }
                    }
                }
                
            }
            
        }

    }
    
}
