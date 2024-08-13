//
//  LoginFields.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct LoginFields: View {
    @Binding var email: String
    @Binding var password: String
    
    enum Field: Hashable {
        case email, pw
    }
    @FocusState private var isKeyboardFocused: Field?
    
    var body: some View {
        VStack(spacing: 12) {
            EmailTextField(placeholder: "user@email.com", text: $email)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
                .focused($isKeyboardFocused, equals: .email)
            
            // TextField
            PasswordField(placeholder: "password", text: $password)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
                .focused($isKeyboardFocused, equals: .pw)
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Cancel") {
                    guard let isKeyboardFocused else { return }
                    switch isKeyboardFocused {
                    case .email:
                        email = ""
                    case .pw:
                        password = ""
                    }
                    self.isKeyboardFocused = nil
                }
                Button("Done") {
                    isKeyboardFocused = nil
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LoginFields(email: .constant(""), password: .constant(""))
}
