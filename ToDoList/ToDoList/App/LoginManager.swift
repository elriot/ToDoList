//
//  LoginManager.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class LoginManager {
    // Fetch login related datea to pass to LoginVM
    
    private let db = Firestore.firestore()
    var currentUser: User?
    
    func signUp(_ fname: String, _ lname: String, _ email: String, _ pw: String) {
        Task {
            do {
                let result = try await Auth.auth().createUser(withEmail: email, password: pw)
                let currentUser = result.user
                let id = result.user.uid
                try await db.collection("Users").document(id).setData([
                    "fname": fname,
                    "lname": lname,
                    "email": email,
                    "id": id
                ])
                print("Document successfully written!")
            } catch {
                print(error)
            }
        }
        
//        Auth.auth().createUser(withEmail: email, password: pw) { [weak self] result, error in
//             if let error {
//                print(error)
//                return
//            }
//            
//            guard let self, let result else { return }
//            
//            currentUser = result.user // firebase User
//            let id = result.user.uid
//            
//            Task { [weak self] in
//                guard let self else { return }
//                
//                do {
//                    try await db.collection("Users").document(id).setData([
//                        "fname": fname,
//                        "lname": lname,
//                        "email": email,
//                        "id": id
//                    ])
//                    print("Document successfully written!")
//                } catch {
//                    print("Error writing document: \(error)")
//                }
//            }
//        }
    }
}
