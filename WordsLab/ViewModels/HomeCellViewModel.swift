//
//  HomeCellViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 23.02.2023.
//

import Foundation

class HomeCellViewModel: HomeCellViewModelType {
    
    private var dictionary: Dictionary
    
    var name: String {
        return dictionary.name
    }
    var folder: String {
        return dictionary.folder
    }
    var date: String {
        return dictionary.date
    }
    
    init(dictionary: Dictionary) {
        self.dictionary = dictionary
    }
}
