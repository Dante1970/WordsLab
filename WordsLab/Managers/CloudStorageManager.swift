//
//  CloudStorageManager.swift
//  WordsLab
//
//  Created by Сергей Белоусов on 23.03.2023.
//

import FirebaseFirestore

class CloudStorageManager {
    
    static let shared = CloudStorageManager()
    
    private let db = Firestore.firestore()
    
    private var userCollectionRef: CollectionReference {
        return db.collection("users")
    }
    
    func createUser(name: String) {
        
        let userUID = AuthManager.shared.getUID()!
        
        userCollectionRef.document(userUID).setData([
            "id": userUID,
            "name": name
        ]) { err in
            if let err = err {
                print("Error setting user \(err)")
            } else {
                print("User successfully created!")
            }
        }
    }
    
    func addFolder(name: String) {
        
        let userUID = AuthManager.shared.getUID()!
        
        userCollectionRef.document(userUID).collection("Folders").document(name).setData([
            "name": name,
            "dictionaries": []
        ]) { err in
            if let err = err {
                print("Error writing document \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}
