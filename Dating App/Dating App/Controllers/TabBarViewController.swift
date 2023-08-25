//
//  ChatScreenViewController.swift
//  Dating App
//
//  Created by Decagon on 04/07/2022.
//

import UIKit
// MARK: The Tabbarcontrollers with its subviews of view controllers
class TabBarViewController: UITabBarController {
    // MARK: Declaring the subview controllers into a navigation controller
    let controllers = UITabBarController()
    let firstVC = UINavigationController(rootViewController: ChatsViewController())
    let secondVC = UINavigationController(rootViewController: FindDatesViewController())
    let thirdVC = UINavigationController(rootViewController: ProfileViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
    }
    
    func setupViewController() {
        let vcIcons = ["message.fill", "person.3.fill", "person.fill"]
        
        firstVC.title = "Chat"
        secondVC.title = "Find"
        thirdVC.title = "Profile"
        
        setViewControllers([firstVC, secondVC, thirdVC], animated: true)
        tabBar.tintColor = #colorLiteral(red: 0.8715636134, green: 0.8204910159, blue: 0.953423202, alpha: 1)
        tabBar.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.07450980392, blue: 0.1843137255, alpha: 1)
        tabBar.layer.cornerRadius = 20
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.6784313725, green: 0.3843137255, blue: 0.6666666667, alpha: 1)
        
        guard let icons = self.tabBar.items else { return }
        
        for icon in 0...2 {
            icons[icon].image = UIImage(systemName: vcIcons[icon])
        }
    }
}
