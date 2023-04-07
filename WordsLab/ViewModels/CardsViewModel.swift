//
//  CardsViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.04.2023.
//

import Foundation

class CardsViewModel {
    
    weak var coordinator: DictionariesCoordinator!
    
    private var dictionary: Dictionary
    
    lazy var numberOfWords = self.dictionary.wordPairs.count
    
    init(dictionary: Dictionary) {
        self.dictionary = dictionary
    }
    
    func cardsCellViewModel(forIndexPath indexPath: IndexPath) -> CardsCellViewModelType? {

        let wordPairs = dictionary.wordPairs[indexPath.row]
        return CardsCellViewModel(wordPairs: wordPairs)
    }
}
