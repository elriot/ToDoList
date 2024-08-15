//
//  UserInfoField.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-14.
//

import SwiftUI

struct UserInfoField: View {
    @Binding var user: AppUser
    
    let size: CGFloat = 150
    
    var body: some View {
        VStack (spacing: 12) {
            
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: size, maxHeight: size)
                .foregroundColor(.blue)
                .padding(.trailing)
            
            Text(user.email)
                .font(.title)
                .padding(20)
                .fontWeight(.heavy)
                
            VStack (alignment: .leading) {
                Text("First Name")
                
                KeyboardView(placeholder: "First name", text: $user.fname)
            }
            .padding(10)
            
            
            VStack (alignment: .leading) {
                Text("Last Name")
                
                KeyboardView(placeholder: "Last name", text: $user.lname)
            }
            .padding(10)

        }
        .padding(.horizontal)
//        .onAppear {
//            dump("check here : \(user)")
//        }
    }
}

#Preview {
    UserInfoField(user: .constant(AppUser(id: "", email: "admin@bao.com", fname: "Admin", lname: "Bao")))
}
