//
//  LoginView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var vm: LoginVM
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            LoginTitleView()
            
            Text(vm.titleText)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            if vm.isLoggingIn {
                LoginFields(email: $vm.email, password: $vm.pw)
                
            } else {
                SignUpFields(fname: $vm.fname, lname: $vm.lname, email: $vm.newEmail, password: $vm.newPw)
            }

            HStack {
                Spacer()
                
                LoginButton(title: vm.titleText) {
                    vm.didTapLoginButton()
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
