//
//  Item.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import Foundation
import FirebaseFirestore

struct Item: Identifiable, Equatable, Hashable {
    let id: String
    let authorId: String
    var title: String
    var description: String
    var startDate: Date = .now
    var status: Status
    var priority: Priority
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(data: [String: Any]) {
        id = data["id"] as! String
        authorId = data["authorId"] as! String
        title = data["title"] as! String
        description = data["description"] as! String
        
        // firebase startdate is timestamp object
        let timestamp = data["startDate"] as! Timestamp
        startDate = timestamp.dateValue()
        
        let statusString = data["status"] as! String
        status = Status(statusString)
        
        let priorityString = data["priority"] as! String
        priority = Priority(priorityString)
    }

}

enum Status: String, CaseIterable {
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

enum Priority: String, CaseIterable {
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
