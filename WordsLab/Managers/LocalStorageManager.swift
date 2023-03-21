//
//  LocalStorageManager.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 20.03.2023.
//

import RealmSwift

class LocalStorageManager {
    
    static let shared = LocalStorageManager()
    
    private let realm = try! Realm()
    
    func add(object: AnyObject) {
        
        try! realm.write {
            realm.add(object as! Object)
        }
    }
    
    func obtainFolders() -> [FolderModel] {
        
        let models = realm.objects(FolderModel.self)
        
        return Array(models)
    }
}
