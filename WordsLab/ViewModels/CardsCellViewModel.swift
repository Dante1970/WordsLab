//
//  CardsViewModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 07.04.2023.
//

import Foundation

class CardsCellViewModel: CardsCellViewModelType {
    
    private var wordPairs: WordPairs
    
    var word: String {
        return wordPairs.word
    }
    
    var translation: String {
        wordPairs.translation
    }
    
    init(wordPairs: WordPairs) {
        self.wordPairs = wordPairs
    }
}
