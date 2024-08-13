//
//  ItemDetailsVM.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-08.
//

import Foundation

final class ItemDetailsVM: ObservableObject {
    @Published var initialItem = Item.empty()
    @Published var updatedItem = Item.empty()
    @Published var didUpdateItem = false
    @Published var updateItemError = false
    
    func updateItem() {
        Task {
            do {
                try await IM.shared.saveItem(updatedItem)
                DispatchQueue.main.async { [weak self] in
                    self?.didUpdateItem = true
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.updateItemError = true
                }
            }
        }
    }
    
}
