//
//  ViewController.swift
//  twi-clone
//
//  Created by Kiril Malenchik on 26.03.21.
//

import UIKit
import FirebaseAuth

class StartViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpStyleElements()
    }

    func setUpStyleElements(){
        Utilities.styleHollowButton(loginButton)
        Utilities.styleFilledButton(signUpButton)
    }
    
    @IBAction func unwindToStartView(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }

}

