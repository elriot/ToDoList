//
//  ContentView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = LoginVM()
    var body: some View {
        switch vm.loginStatus {
        case .unknown:
            Text("unknown")
        case .loggedIn:
            HomeView()
        case .loggedOut:
            LoginView()
                .environmentObject(vm)
        }
    }
}

#Preview {
    ContentView()
}
