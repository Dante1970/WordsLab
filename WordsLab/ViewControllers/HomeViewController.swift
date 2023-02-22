//
//  HomeViewController.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 22.02.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func loadView() {
        self.view = HomeView()
    }
    
    private var mainView: HomeView {
         guard let customView = view as? HomeView else {
             fatalError("Expected view to be of type \(HomeView.self) but got \(type(of: view)) instead")
         }
         return customView
     }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
