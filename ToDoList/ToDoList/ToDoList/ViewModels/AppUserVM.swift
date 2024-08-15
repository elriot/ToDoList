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
                    updatedUser = initialUser
                }
            } catch {
                throw error
            }
        }
    }
    
    func updateAppUser() {
        Task {
            do {
                try await UM.shared.updateAppUser(updatedUser)
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.didUpdateUser = true
                    self.initialUser = self.updatedUser
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    self?.updateUserError = true
                }
            }
        }
    }
}
