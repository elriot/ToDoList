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
    
    var body: some View {
        VStack(spacing: 12) {
            KeyboardView(placeholder: "First name", text: $fname)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
            
            KeyboardView(placeholder: "Last name", text: $lname)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
            
            EmailTextField(placeholder: "user@email.com", text: $email)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
            
            // TextField
            PasswordField(placeholder: "password", text: $password)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SignUpFields(fname: .constant(""), lname: .constant(""), email: .constant(""), password: .constant(""))
}
