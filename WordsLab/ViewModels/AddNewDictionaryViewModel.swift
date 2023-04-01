//
//  AddNewDictionaryViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 26.03.2023.
//

import Foundation
import UIKit

class AddNewDictionaryViewModel {
    
    weak var coordinator: DictionariesCoordinator!
    
    var numberOfRows: Int = 2
    
    func addNewWord() {
        numberOfRows += 1
    }
    
    func doneTapped(name: String, cells: [UITableViewCell]) {
        
        var wordPairs = [String: String]()
        
        for cell in cells {
            
            let mainView = cell.contentView.subviews[0]
            
            guard
                let textField1 = (mainView.subviews.first(where: { $0.tag == 1 }) as? UITextField)?.text,
                let textField2 = (mainView.subviews.first(where: { $0.tag == 2 }) as? UITextField)?.text
            else { continue }
            
            if textField1 != "" && textField2 != "" {
                wordPairs.updateValue(textField2, forKey: textField1)
            }
        }
        
        let appCoordinator = coordinator.parentCoordinator as! AppCoordinator
        
        LocalStorageManager.shared.addDictionary(ownerId: appCoordinator.userUID!, name: name, folder: nil, date: "01.01.23", wordPairs: wordPairs)
    }
    
    func alertOk(title: String, message: String) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(actionOk)
        return alertController
    }
}
