//
//  MainTabBarController.swift
//  sandbox-ios
//
//  Created by bookair18 on 2022/09/30.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        let oneViewController = ViewController()
        oneViewController.view.backgroundColor = UIColor.init(red: 0, green: 255, blue: 255, alpha: 1)
        oneViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        let twoViewController = ViewController()
        twoViewController.view.backgroundColor = UIColor.init(red: 255, green: 0, blue: 0, alpha: 1)
        twoViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        viewControllers = [oneViewController, twoViewController]
    }

}
