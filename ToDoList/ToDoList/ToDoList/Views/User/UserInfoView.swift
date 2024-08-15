//
//  UserInfoView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-14.
//

import SwiftUI

struct UserViewInfo: View {
    @Binding var path: [NavPath]
    @EnvironmentObject var loginVM: LoginVM
    @StateObject private var vm = AppUserVM()
    @State private var showLogout: Bool = false

    var body: some View {
        VStack {
            VStack {
                UserInfoField(user: $vm.updatedUser)
            }
            
            Spacer()
            
            if vm.initialUser.isDifferent(compareTo: vm.updatedUser) {
                CTAButton(title: "Update") {
                    vm.updateAppUser(user: vm.updatedUser)
                }
            }
        }
        .padding(.horizontal)
        .alert("Alert", isPresented: $vm.updateUserError){
            Button("Dismiss", role: .cancel) {}
        } message: {
            Text("Error updating user info.")
        }
        .alert("Success!", isPresented: $vm.didUpdateUser) {
            Button("Done", role: .cancel) {}
        } message: {
            Text("user name saved successfully.")
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing, content: {
                Button {
                    showLogout = true
                } label: {
                    Text("Sign out")
                }
            })
        }
        .confirmationDialog("Continue signing out?", isPresented: $showLogout){
            Button("Confirm", role: .destructive){
                Task {
                    do {
                        try await loginVM.signOut()
                    } catch {
                        print(error)
                        throw error
                    }
                }
            }
            Button("Cancel", role: .cancel){}
        } message: {
            Text("Continue signing out?")
        }
    }
}

//#Preview {
//    UserViewInfo(path: .constant([]))
//}
