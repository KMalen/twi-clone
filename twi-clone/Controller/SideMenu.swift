//
//  SideMenu.swift
//  twi-clone
//
//  Created by Kiril Malenchik on 1.04.21.
//

import Foundation
import UIKit
import FirebaseAuth

// TODO: Change color in a selected row
class MenuListController: UITableViewController {
    
    public var delegate: MenuControllerDelegate?
    
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
        
    }
    
}
