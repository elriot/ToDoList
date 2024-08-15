//
//  AppUser.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-14.
//

import Foundation

struct AppUser: Identifiable, Equatable, Hashable {
    var id: String
    var email: String
    var fname: String
    var lname: String
    
    static func == (lhs: AppUser, rhs: AppUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func isDifferent(compareTo user: AppUser) -> Bool {
        return id != user.id
        || email != user.email
        || fname != user.fname
        || lname != user.lname
    }
    
    init(id: String, email: String, fname: String, lname: String) {
        self.id = id
        self.email = email
        self.fname = fname
        self.lname = lname
    }
    
    static func empty() -> AppUser {
        return AppUser(id: "", email: "", fname: "", lname: "")
    }
    
    func toObject() -> [String: Any] {
        var data: [String: Any] = [:]
        data["id"] = id
        data["email"] = email
        data["fname"] = fname
        data["lname"] = lname
        return data
    }
}
