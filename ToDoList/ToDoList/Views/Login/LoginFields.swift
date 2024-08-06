//
//  LoginFields.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct LoginFields: View {
    @State private var email = ""
    @State private var password = ""
    
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
    LoginFields()
}
