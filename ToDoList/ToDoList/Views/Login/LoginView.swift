//
//  LoginView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct LoginView: View {
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
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginView()
}
