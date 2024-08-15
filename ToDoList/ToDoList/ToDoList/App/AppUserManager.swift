//
//  AppUserManager.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-14.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

//protocol UsersManagerDelegate where Self: AppUserVM {
//    func didUpdateUser(_ user: AppUser)
//}
typealias UM = UsersManager
final class UsersManager {
    static let shared = UsersManager()
    private init() {}
    
//    weak var delegate: UsersManagerDelegate?
    private let db = Firestore.firestore()
//    private var listener: ListenerRegistration?
    
//    deinit {
//        removeListener()
//    }
//    
//    private func removeListener() {
//        listener?.remove()
//        listener = nil
//    }
    
    func updateAppUser(_ user: AppUser) async throws {
        do {
            try await db.collection("Users").document(user.id).setData(user.toObject())
            print("Document successfully written!")
        } catch {
            print("Error writing document: \(error)")
            throw error
        }
    }
}
