//
//  FolderModel.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 20.03.2023.
//

import RealmSwift

class FolderModel: Object {
    
    @Persisted(primaryKey: true) var _id: ObjectId = ObjectId.generate()
    @Persisted var name: String
    @Persisted var ownerId: String
    
    convenience init(name: String, ownerId: String) {
        self.init()
        self.name = name
        self.ownerId = ownerId
    }
}
