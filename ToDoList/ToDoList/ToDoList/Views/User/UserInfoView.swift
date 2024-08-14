//
//  UserInfoView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-14.
//

import SwiftUI

struct UserViewInfo: View {
    @Binding var path: [NavPath]
    @StateObject private var vm = UserInfoVM()
    let size: CGFloat = 150
    
    var email = "bao@admin.com"
    
    var body: some View {
        VStack (alignment: .center) {
            
            Image(systemName: "person.circle")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: size, maxHeight: size)
                .foregroundColor(.blue)
                .padding(.trailing)
            
            Text(email)
                .font(.title)
                .padding(20)
                .fontWeight(.heavy)
                
            Text("fname : \(vm.fname)")
            Text("lname : \(vm.lname)")
            Text("email: \(vm.email)")
            
            Text("email: \(vm.initialUser.fname)")
        }
    }
}

#Preview {
    UserViewInfo(path: .constant([]))
}
