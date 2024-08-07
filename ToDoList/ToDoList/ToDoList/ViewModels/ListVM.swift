//
//  ListVM.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import Foundation

final class ListVM: Observable {
    @Published var todoItems: [Item] = [
        Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low),
        Item(id: "1234", authorId: "John Doe two", title: "Second item", description: "Second", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "4567", authorId: "John Doe three", title: "Third item", description: "Third", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @Published var inProgressItems: [Item] = [
        Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low),
        Item(id: "1234", authorId: "John Doe two", title: "Second item", description: "Second", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "4567", authorId: "John Doe three", title: "Third item", description: "Third", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @Published var doneItems: [Item] = [
        Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low),
        Item(id: "1234", authorId: "John Doe two", title: "Second item", description: "Second", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "4567", authorId: "John Doe three", title: "Third item", description: "Third", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @Published var unknown: [Item] = []
}
