//
//  ListView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct ListView: View {
    let title: String
    @Binding var items: [Item]
    @Binding var shouldReDraw: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            if shouldReDraw {
                EmptyView()
            }
            
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight: 32)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.orange)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 2)
                        }
                }
                .padding(.horizontal)
                .padding(.top)
            
            List($items){ $item in
                NavigationLink(value: NavPath.details(item)) {
                    ListItemView(item: item, height: 100)
                }
                
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ListView(title: "To do", items: .constant([
        Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low),
        Item(id: "1234", authorId: "John Doe two", title: "Second item", description: "Second", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "4567", authorId: "John Doe three", title: "Third item", description: "Third", startDate: .now + 10, status: .todo, priority: .low)
    ]), shouldReDraw: .constant(false))
}
