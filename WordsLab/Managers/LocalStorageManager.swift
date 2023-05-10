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
    
    func addDictionary(ownerId: String, name: String, folder: FolderModel?, date: String, wordPairs: [String: String]) {
        
        try! realm.write {
            
            let dictionary = Dictionary(ownerId: ownerId, name: name, folder: folder, date: date)
            
            for wordPair in wordPairs {
                let wordPairs = WordPairs()
                wordPairs.word = wordPair.key
                wordPairs.translation = wordPair.value
                dictionary.wordPairs.append(wordPairs)
            }

            realm.add(dictionary)
        }
    }
    
    func deleteDictionary(dictionary: Dictionary) {
        
        let dictionaryToDelete = realm.object(ofType: Dictionary.self, forPrimaryKey: dictionary._id)
        
        let wordPairsToDelete = dictionaryToDelete!.wordPairs
        
        try! realm.write {
            
            realm.delete(wordPairsToDelete)
            
            realm.delete(dictionaryToDelete!)
        }
    }
    
    func obtainFolders() -> [FolderModel] {
        
        let models = realm.objects(FolderModel.self)
        
        return Array(models)
    }
    
    func obtainDictionaries() -> [Dictionary] {
        
        let models = realm.objects(Dictionary.self)
        
        return Array(models)
    }
}
