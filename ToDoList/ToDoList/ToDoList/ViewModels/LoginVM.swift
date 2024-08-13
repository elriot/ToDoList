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
    @Published var loginSuccess = false
    @Published var loginErrorMessage = ""
    
    @Published var signupSuccess = false
    @Published var signupError = false
    @Published var signupErrorMessage = ""
//    @Published var didLogin = false
    
    init() {
        auth.delegate = self
    }
    
    func didTapLoginButton() {
        if isLoggingIn {
            Task {
                do {
                    try await auth.signIn(email, pw)
                    DispatchQueue.main.async { [weak self] in
                        self?.loginSuccess = true
                    }
                } catch {
                    DispatchQueue.main.async { [weak self] in
                        self?.loginError = true
                        self?.loginErrorMessage = error.localizedDescription
                    }
                }
            }
        } else {
            Task {
                do {
                    try await auth.signUp(fname, lname, newEmail, newPw)
                    DispatchQueue.main.async { [weak self] in
                        self?.signupSuccess = true
                    }
                } catch {
                    DispatchQueue.main.async { [weak self] in
                        self?.signupError = true
                        self?.signupErrorMessage = error.localizedDescription
                    }
                }
            }
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
    
    func clearSignUpField() {
        newEmail = ""
        newPw = ""
        fname = ""
        lname = ""
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
