//
//  HomeViewController.swift
//  twi-clone
//
//  Created by Kiril Malenchik on 31.03.21.
//

import UIKit
import SideMenu
import FirebaseAuth

class HomeViewController: UIViewController, MenuControllerDelegate {
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sideMenu = MenuListController()
        sideMenu.delegate = self
        
        menu = SideMenuNavigationController(rootViewController: sideMenu)
        
        setUpStyleElements()
        
    }
    
    // Setup navigation bar style and menu side style
    func setUpStyleElements(){
        
        menu?.leftSide = true
        menu?.menuWidth = view.frame.width / 3
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        title = "Home"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 25)!]
    }
    
    // action on menu button
    @IBAction func menuButtonTapped(){
        
        // Just for debug sign in user
        let user = Auth.auth().currentUser
        if let user = user {
            print("User UID: \(user.uid)")
        }
        
        present(menu!, animated: true, completion: nil)
    }
    
    func didSelectMenuItem(named: String) {
        
        menu?.dismiss(animated: true, completion: { [weak self] in
            
            switch named {
            case "Log Out":
                
                let firebaseAuth = Auth.auth()
                
                do {
                    try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                    print ("Error sign out: %@", signOutError)
                }
                
                self?.performSegue(withIdentifier: "unwindToStartView", sender: self)
                 
            default:
                break
            }
            
        })
        
    }
    
}

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: String)
}
