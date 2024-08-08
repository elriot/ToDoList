//
//  ItemsManager.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-07.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol ItemsManagerDelegate where Self: ListVM {
    func didFetchBetchItems(_ items: [Status: [Item]])
    func didAddItem(_ item: Item)
    func didUpdateItem(_ item: Item)
    func didDeleteItem(_ item: Item)
}

typealias IM = ItemsManager
final class ItemsManager {
    static let shared = ItemsManager()
    private let db = Firestore.firestore()
    weak var delegate: ItemsManagerDelegate?
    private var isInitialFetch = true
    private init() {}
    private var allItems: [Status: [Item]] = [
        .todo: [],
        .inProgress: [],
        .done: []
    ]
    
    func fetchItems() {
        guard let currentUser = Auth.auth().currentUser else { return }
        let id = currentUser.uid
        
        db.collection("Items").whereField("authorId", isEqualTo: id).addSnapshotListener { [weak self] snapshot, err in
            if let err {
                print("Error fetching document: \(err)")
                return
            }
            guard let self, let snapshot else { return }
    
            snapshot.documentChanges.forEach { [weak self] diff in
                guard let self else { return }
                let data = diff.document.data()
                let item = Item(data: data)
                dump("data \(data)")
                switch diff.type {
                case .added:
                    if isInitialFetch {
                        allItems[item.status]?.append(item)
                    } else {
                        delegate?.didAddItem(item)
                    }
                case .modified:
                    delegate?.didUpdateItem(item)
                case .removed:
                    delegate?.didDeleteItem(item)
                }
            }
            guard isInitialFetch else { return }
            delegate?.didFetchBetchItems(allItems)
            isInitialFetch = false
        }
    }
    
    private func sortBatchItems() {
        // perform sorting logic
        var sortedItems: [Status: [Item]] = [:]
        allItems.keys.forEach { status in
            sortedItems[status] = allItems[status]?.sorted(by: { $0.startDate > $1.startDate
            })
        }
        
        delegate?.didFetchBetchItems(allItems)
    }
}
