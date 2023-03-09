//
//  DictionariesCoordinator.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.03.2023.
//

import Foundation
import UIKit

class DictionariesCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    func start() {
        goToDictionaries()
    }
    
    private func goToDictionaries() {
        
        let dictionariesViewController = DictionariesViewController()
        let dictionariesViewModel = DictionariesViewModel()
        dictionariesViewModel.coordinator = self
        dictionariesViewController.viewModel = dictionariesViewModel
        navigationController.pushViewController(dictionariesViewController, animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("Deinit dictionaries coordinator")
    }
}
