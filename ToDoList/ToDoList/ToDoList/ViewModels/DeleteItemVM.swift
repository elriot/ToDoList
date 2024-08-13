//
//  DeleteItemVM.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-12.
//

import Foundation
import FirebaseAuth

final class DeleteItemVM: ObservableObject {
    @Published var didDelteItem = false
    @Published var deleteItemError = false
    
    func deleteItem(item: Item){
        Task {
            do {
                try await IM.shared.deleteItem(item)
                DispatchQueue.main.async { [weak self] in
                    self?.didDelteItem = true
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.deleteItemError = true
                }
            }
        }
    }
}
