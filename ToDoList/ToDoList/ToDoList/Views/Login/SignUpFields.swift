//
//  SignUpFields.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct SignUpFields: View {
    @Binding var fname: String
    @Binding var lname: String
    @Binding var email: String
    @Binding var password: String
    
    enum Field: Hashable {
        case fname, lname, email, password
    }
    @FocusState private var isKeyboardFocused: Field?
    
    
    var body: some View {
        VStack(spacing: 12) {
            KeyboardView(placeholder: "First name", text: $fname)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
                .focused($isKeyboardFocused, equals: .fname)
            
            KeyboardView(placeholder: "Last name", text: $lname)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
                .focused($isKeyboardFocused, equals: .lname)
            
            EmailTextField(placeholder: "user@email.com", text: $email)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
                .focused($isKeyboardFocused, equals: .email)
            
            // TextField
            PasswordField(placeholder: "password", text: $password)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
                .focused($isKeyboardFocused, equals: .password)
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Cancel") {
                    guard let isKeyboardFocused else { return }
                    switch isKeyboardFocused {
                    case .fname:
                        fname = ""
                    case .lname:
                        lname = ""
                    case .email:
                        email = ""
                    case .password:
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

#Preview {
    SignUpFields(fname: .constant(""), lname: .constant(""), email: .constant(""), password: .constant(""))
}
