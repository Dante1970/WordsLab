//
//  Dictionary.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 23.02.2023.
//

import RealmSwift

//struct Dictionary {
//    var name: String
//    var folder: String?
//    var date: String
//    var wordPairs: [(String, String)]
//}


class Dictionary: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId = ObjectId.generate()
    @Persisted var ownerId: String
    @Persisted var name: String
    @Persisted var folder: FolderModel?
    @Persisted var date: String
    @Persisted var wordPairs = List<WordPairs>()
    
    
    convenience init(ownerId: String, name: String, folder: FolderModel?, date: String) {
        self.init()
        self.ownerId = ownerId
        self.name = name
        self.folder = folder
        self.date = date
    }
}
