//
//  ItemsManager.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-07.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

typealias IM = ItemsManager
final class ItemsManager {
    static let shared = ItemsManager()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func fetchItems() {
        guard let currentUser = Auth.auth().currentUser else { return }
        let id = currentUser.uid
        
        db.collection("Items").whereField("authorId", isEqualTo: id).addSnapshotListener { snapshot, err in
            if let err {
                print("Error fetching document: \(err)")
                return
            }
            guard let snapshot else { return }
            snapshot.documentChanges.forEach { diff in
                let data = diff.document.data()
                let item = Item(data: data)
                dump("data \(data)")
                switch diff.type {
                case .added:
                    <#code#>
                case .modified:
                    <#code#>
                case .removed:
                    <#code#>
                }
            }
        }
    }
}
