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
    
    lazy var dictionariesViewModel = DictionariesViewModel(coordinator: self)
    
    func start() {
        goToDictionaries()
    }
    
    private func goToDictionaries() {
        
        let dictionariesViewController = DictionariesViewController()
        dictionariesViewModel.dictionaries = LocalStorageManager.shared.obtainDictionaries()
        dictionariesViewController.viewModel = dictionariesViewModel
        navigationController.pushViewController(dictionariesViewController, animated: true)
    }
    
    func goToAddNewDictionary() {
        
        let addNewDictionaryViewController = AddNewDictionaryViewController()
        addNewDictionaryViewController.viewModel = dictionariesViewModel
        navigationController.pushViewController(addNewDictionaryViewController, animated: true)
    }
    
    func goToCards(dictionary: Dictionary) {
        
        let cardsViewController = CardsViewController()
        cardsViewController.title = dictionary.name
        cardsViewController.viewModel = CardsViewModel(dictionary: dictionary)
        navigationController.pushViewController(cardsViewController, animated: true)
    }
    
    func goBackToDictionaries() {
        
        navigationController.popViewController(animated: true)
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("Deinit dictionaries coordinator")
    }
}
