//
//  LoginView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var vm = LoginVM()
//    @State private var title = "Login"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            LoginTitleView()
            
            Text(vm.titleText)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            if vm.isLoggingIn {
                LoginFields()
                
            } else {
                SignUpFields()
            }

            HStack {
                Spacer()
                
                LoginButton(title: vm.titleText) {
                    print("tap login Button")
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            TogglePromptView(text: $vm.toggleText, prompt: $vm.prompt, isLogginIn: $vm.isLoggingIn)
        }
        .padding(.horizontal)
    }
    
    
}

#Preview {
    LoginView()
}
