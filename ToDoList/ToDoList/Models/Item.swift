//
//  Item.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import Foundation

struct Item: Identifiable {
    let id: String
    let authorId: String
    var title: String
    var description: String
    var startDate: Date = .now
    var status: Status
    var priority: Priority
}

enum Status: String {
    case todo = "To Do"
    case inProgress = "In Progress"
    case done = "Done"
    case unknown = "Unknown"
    
    init(_ str: String) {
        self = switch str.lowercased() {
        case "todo" : .todo
        case "inprogress" : .inProgress
        case "done" : .done
        default : .unknown
        }
    }
}

enum Priority: String {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    case unknown = "Unknown"
    
    init(_ str: String) {
        self = switch str.lowercased() {
        case "low" : .low
        case "medium" : .medium
        case "high" : .high
        default : .unknown
        }
    }

}
