//
//  MainTabBarViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 22.02.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = BaseColors.backgroundColor
        
        let vc1 = HomeViewController()
        let vc2 = FoldersViewController()
        let vc3 = DictionariesViewController()
        let vc4 = ProfileViewController()
        
        vc1.tabBarItem.image = UIImage(named: "Home")
        vc2.tabBarItem.image = UIImage(named: "Folder")
        vc3.tabBarItem.image = UIImage(named: "Dictionary")
        vc4.tabBarItem.image = UIImage(named: "Profile")
        
        vc1.title = "Home"
        vc2.title = "Folder"
        vc3.title = "Dictionaries"
        vc4.title = "Profile"
        
        tabBar.tintColor = BaseColors.blue
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}
