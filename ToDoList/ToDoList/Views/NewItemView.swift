//
//  NewItemView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct NewItemView: View {
    @State private var text = ""
    @State private var description = ""
    @State private var item = Item(id: "abcd", authorId: "John", title: "leetcode", description: "Solve easy problem tomorrow", status: .todo, priority: .high)
    
    var body: some View {
        VStack(spacing: 10) {
            TitledTextField(title: "Title", placeholder: "What do you need to do?", text: $text)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a brief description", text: $description)
            
            Divider()
            
            StatusMenu(status: $item.status)
            
            Divider()
            
            PriorityMenu(priority: $item.priority)
        }
    }
}

#Preview {
    NewItemView()
}
