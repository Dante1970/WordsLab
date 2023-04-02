//
//  DictionaryTableViewCellViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 02.04.2023.
//

import Foundation

class DictionaryTableViewCellViewModel {
    
    private var dictionary: Dictionary
    
    var name: String {
        return dictionary.name
    }
    
    var date: String {
        return dictionary.date
    }
    
    var folder: String? {
        return dictionary.folder?.name
    }
    
    init(dictionary: Dictionary) {
        self.dictionary = dictionary
    }
}
