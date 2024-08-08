//
//  ItemDetailsVM.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-08.
//

import Foundation

final class ItemDetailsVM: ObservableObject {
    @Published var initialItem = Item.empty()
    @Published var updatedItem = Item(id: "abcd", authorId: "John", title: "leetcode", description: "Solve easy problem tomorrow", startDate: .now, status: .todo, priority: .high)
    
    
}
