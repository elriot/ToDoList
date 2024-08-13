//
//  LoginVM.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import Foundation

final class LoginVM: ObservableObject {
    private let auth = LoginManager()
    
    enum Status {
        case unknown, loggedIn, loggedOut
    }
    
    @Published var loginStatus: Status = .unknown
    
    @Published var isLoggingIn = true {
        didSet {
            if isLoggingIn {
                titleText = "Login"
                toggleText = "Don't have an account?"
                prompt = "Sign up here"
            } else {
                titleText = "Sign up"
                toggleText = "Already a user?"
                prompt = "Login here"
            }
        }
    }
    @Published var toggleText = "Don't have an account?"
    @Published var prompt = "Sign up here"
    @Published var titleText = "Login"
    @Published var email = ""
    @Published var pw = ""
    
    /// newEmail, newPw variables for signup
    @Published var newEmail = ""
    @Published var newPw = ""
    @Published var fname = ""
    @Published var lname = ""
    
    @Published var loginError = false
//    @Published var didLogin = false
    
    init() {
        auth.delegate = self
    }
    
    func didTapLoginButton() {
        if isLoggingIn {
            Task {
                do {
                    try await auth.signIn(email, pw)
                } catch {
                    DispatchQueue.main.async { [weak self] in
                        self?.loginError = true
                    }
                }
            }
        } else {
            auth.signUp(fname, lname, newEmail, newPw)
        }
    }
    
    func signOut() async throws {
        do {
            try await auth.signOut()
        } catch {
            print(error)
            throw error
        }
    }
}

extension LoginVM: LoginManagerDelegate {
    func authStateDidChange(isLoggedIn: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            loginStatus = isLoggedIn ? .loggedIn : .loggedOut
        }
        
    }
}
