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
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(systemName: "person.circle")
                .scaledToFit()
                .frame(maxHeight: 20)
            
            Text("fname : \(vm.fname)")
            Text("lname : \(vm.lname)")
            Text("email: \(vm.email)")
            Text("pw: \(vm.pw)")
        }
    }
}

#Preview {
    UserViewInfo(path: .constant([]))
}
