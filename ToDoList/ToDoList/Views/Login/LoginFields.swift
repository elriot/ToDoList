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
    
    var body: some View {
        VStack(spacing: 12) {
            EmailTextField(placeholder: "user@email.com", text: $email)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
            
            // TextField
            PasswordField(placeholder: "password", text: $password)
                .shadow(color: .lightGray, radius: 3, x: 1, y: 2.5)
        }
        .padding(.horizontal)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LoginFields(email: .constant(""), password: .constant(""))
}
