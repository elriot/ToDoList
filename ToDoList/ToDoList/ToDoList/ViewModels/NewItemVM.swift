//
//  NewItemVM.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-08.
//

import Foundation
import FirebaseAuth

final class NewItemVM: ObservableObject {
    @Published var newItem = Item.empty()
    @Published var saveItemError = false
    @Published var didSaveItem = false
    
    init() {
        guard let user = Auth.auth().currentUser else { return }
        newItem = Item(
            id: UUID().uuidString,
            authorId: user.uid,
            title: "",
            description: "",
            startDate: .now,
            status: .todo,
            priority: .low
        )
    }
    
    func saveNewItem() {
        Task {
            do {
                try await IM.shared.saveItem(newItem)
                DispatchQueue.main.async { [weak self] in
                    self?.didSaveItem = true
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.saveItemError = true
                }
            }
        }
    }
}
