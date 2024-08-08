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
    
    init(id: String, authorId: String, title: String, description: String, startDate: Date, status: Status, priority: Priority) {
        self.id = id
        self.authorId = authorId
        self.title = title
        self.description = description
        self.startDate = startDate
        self.status = status
        self.priority = priority
    }
    
    static func empty() -> Item {
        return Item(id: "", authorId: "", title: "", description: "", startDate: .now, status: .todo, priority: .low)
    }
    
    func toObject() -> [String: Any] {
        var data: [String: Any] = [:]
        data["id"] = id
        data["authorId"] = authorId
        data["title"] = title
        data["description"] = description
        data["startDate"] = Timestamp(date: startDate)
        data["status"] = status.toString()//status.rawValue
        data["priority"] = status.toString()//priority.rawValue
        return data
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
    
    func toString() -> String {
        switch self {
            
        case .todo:
            return "todo"
        case .inProgress:
            return "inprogress"
        case .done:
            return "done"
        case .unknown:
            return ""
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
    
    func toString() -> String {
        switch self {
            
        case .low:
            return "low"
        case .medium:
            return "medium"
        case .high:
            return "high"
        case .unknown:
            return ""
        }
    }

}
