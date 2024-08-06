//
//  ItemDetailsView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    
    
    var body: some View {
        VStack {
            Text(item.title)
            
            Text(item.description)
            
            Text(item.status.rawValue)
            
            Text(item.priority.rawValue)
        }
    }
}

#Preview {
    ItemDetailsView(item: Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low))
}
