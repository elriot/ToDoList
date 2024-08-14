//
//  UserInfoVM.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-14.
//

import Foundation
final class UserInfoVM: ObservableObject {
    private let auth = LoginManager()

    @Published var email = ""
//    @Published var pw = "" // it's encrypted! Cannot be accessed by the client.
    @Published var newPw = ""
    @Published var fname = ""
    @Published var lname = ""
    @Published var newFname = ""
    @Published var newLname = ""
    
    init() {
        Task {
            do {
                let result = try await auth.getUserInfo()
                DispatchQueue.main.async {
                    self.fname = result["fname"] ?? ""
                    self.lname = result["lname"] ?? ""
                    self.email = result["email"] ?? ""
//                    self.pw = result["pw"] ?? ""
                }
            } catch {
                throw error
            }
        }
    }
}
