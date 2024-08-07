//
//  ItemDetailsView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    @State private var updatedItem = Item(id: "abcd", authorId: "John", title: "leetcode", description: "Solve easy problem tomorrow", status: .todo, priority: .high)
    
    var body: some View {
        VStack(spacing: 10) {
            
            TitledTextField(title: "Title", placeholder: "What do you need to do?", text: $updatedItem.title)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a brief description", text: $updatedItem.description)
            
            Divider()
            
            StatusMenu(status: $updatedItem.status)
            
            Divider()
            
            PriorityMenu(priority: $updatedItem.priority)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Details")
    }
}

#Preview {
    ItemDetailsView(item: Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low))
}
