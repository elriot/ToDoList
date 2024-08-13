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
                .alert("Failed to Login", isPresented: $vm.loginError){
                    Button("Try Again", role: .cancel) {}
                } message: {
                    Text(vm.loginErrorMessage)
                }
                .alert("Failed to Signup", isPresented: $vm.signupError){
                    Button("Try Again", role: .cancel) {}
                } message: {
                    Text(vm.signupErrorMessage)
                }
                .alert("You're ready!", isPresented: $vm.signupSuccess){
                    Button("Go Login", role: .cancel) {
                        vm.email = vm.newEmail
                        vm.clearSignUpField()
                        vm.isLoggingIn = true
                    }
                } message: {
                    Text("You’ve successfully Signed up!")
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
