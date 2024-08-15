//
//  AppUserVM.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-14.
//

import Foundation
final class AppUserVM: ObservableObject {
    private let auth = LoginManager()
    
    @Published var initialUser = AppUser.empty()
    @Published var updatedUser = AppUser.empty()
    
    @Published var didUpdateUser = false
    @Published var updateUserError = false
    
    init() {
        Task {
            do {
                let user = try await auth.getUser()
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    initialUser = user
                    updatedUser.id = initialUser.id
                    updatedUser.email = initialUser.email
                    updatedUser.fname = initialUser.fname
                    updatedUser.lname = initialUser.lname
                }
            } catch {
                throw error
            }
        }
    }
    
    func updateAppUser(user: AppUser){
        Task {
            do {
                try await UM.shared.updateAppUser(user)
                DispatchQueue.main.async { [weak self] in
                    self?.didUpdateUser = true
                    self?.initialUser.fname = user.fname
                    self?.initialUser.lname = user.lname
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.updateUserError = true
                }
            }
        }
    }
    
}
