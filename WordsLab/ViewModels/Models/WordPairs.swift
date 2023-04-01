//
//  WordPairs.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 30.03.2023.
//

import RealmSwift

class WordPairs: Object {
    @Persisted var word: String
    @Persisted var translation: String
}
