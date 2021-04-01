//
//  HomeViewController.swift
//  twi-clone
//
//  Created by Kiril Malenchik on 31.03.21.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController {
    
    var menu = SideMenuNavigationController(rootViewController: MenuListController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpStyleElements()
        
    }
    
    func setUpStyleElements(){
        
        menu.leftSide = true
        menu.menuWidth = view.frame.width / 3
        menu.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        title = "Home"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 25)!]
        
    }
    
    @IBAction func menuButtonTapped(){
        present(menu, animated: true, completion: nil)
    }

}

// TODO: Change color in a selected row
class MenuListController: UITableViewController {
    
    var menuItems = ["Profile", "Friends", "News", "Messages", "Settings", "Log Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = menuItems[indexPath.row]
        
        // Set up font style and background style
        cell.textLabel?.font = UIFont(name: "Futura", size: 20)
        cell.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        cell.textLabel?.textColor = UIColor.white
        
        return cell
    }
    
}
