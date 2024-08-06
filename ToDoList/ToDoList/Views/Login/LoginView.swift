//
//  LoginView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct LoginView: View {
    
    @State private var text = "Don't have an account?"
    @State private var prompt = "Sign up here"
    @State private var isLoggingIn = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            LoginTitleView()
            
            LoginFields()
                
            
            HStack {
                Spacer()
                
                LoginButton(title: "Login") {
                    print("tap login Button")
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            TogglePromptView(text: $text, prompt: $prompt, isLogginIn: $isLoggingIn)
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginView()
}
