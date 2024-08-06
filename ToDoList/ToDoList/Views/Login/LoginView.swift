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
            
            Text("Login")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
//            TextField
            
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
