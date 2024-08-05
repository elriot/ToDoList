//
//  HomeView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct HomeView: View {
    
    @State private var path = NavigationPath()
    @State private var todoItems: [Item] = [
        Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low),
        Item(id: "1234", authorId: "John Doe two", title: "Second item", description: "Second", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "4567", authorId: "John Doe three", title: "Third item", description: "Third", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @State private var inProgressItems: [Item] = [
        Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low),
        Item(id: "1234", authorId: "John Doe two", title: "Second item", description: "Second", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "4567", authorId: "John Doe three", title: "Third item", description: "Third", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @State private var doneitems: [Item] = [
        Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low),
        Item(id: "1234", authorId: "John Doe two", title: "Second item", description: "Second", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "4567", authorId: "John Doe three", title: "Third item", description: "Third", startDate: .now + 10, status: .todo, priority: .low)
    ]
    
    var body: some View {
        NavigationStack {
            TabView {
                ListView(title: "To Do", items: $todoItems)
                
                ListView(title: "In Progress", items: $inProgressItems)
                
                ListView(title: "Done", items: $doneitems)
            }
            .tabViewStyle(.page)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button {
                        print("Logout")
                    } label: {
                        Image(systemName: "person.circle")
                    }
                })
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button {
                        print("Navigato to new item")
                    } label: {
                        Image(systemName: "plus")
                    }
                })
            }
            .navigationDestination(for: String.self) { _ in
                Text("New View Here")
                
            }
        }

    }
}

#Preview {
    HomeView()
}
