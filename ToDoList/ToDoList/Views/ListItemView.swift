//
//  ListItemView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct ListItemView: View {
    let item: Item
    let height: CGFloat
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 3) {
                Text(item.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(item.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.blue)
                .frame(maxHeight: height * 0.45)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListItemView(item: Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low), height: 100)
}
