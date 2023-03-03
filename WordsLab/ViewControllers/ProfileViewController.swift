//
//  ProfileViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 22.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func loadView() {
        self.view = ProfileView()
    }
    
    private var mainView: ProfileView {
         guard let customView = view as? ProfileView else {
             fatalError("Expected view to be of type \(ProfileView.self) but got \(type(of: view)) instead")
         }
         return customView
     }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
