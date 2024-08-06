//
//  LoginFields.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct LoginFields: View {
    @State private var email = ""
    var body: some View {
        VStack(spacing: 12) {
            EmailTextField(placeholder: "user@email.com", text: $email)
            
            // TextField
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginFields()
}
