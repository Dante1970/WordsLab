//
//  AddNewDictionaryViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 26.03.2023.
//

import Foundation

class AddNewDictionaryViewModel {
    
    weak var coordinator: DictionariesCoordinator!
    
    var numberOfRows: Int = 2
    
    func addNewWord() {
        numberOfRows += 1
    }
}
