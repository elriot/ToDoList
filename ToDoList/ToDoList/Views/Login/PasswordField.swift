//
//  PasswordField.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct PasswordField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "lock")
                .resizable()
                .scaledToFit()
                .frame(height: 15)
            
            SecureField(placeholder, text: $text)
                .submitLabel(.done)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .background(.clear)
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 0.3)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.background)
                )
            
        )
    }
}

#Preview {
    PasswordField(placeholder: "", text: .constant(""))
}
