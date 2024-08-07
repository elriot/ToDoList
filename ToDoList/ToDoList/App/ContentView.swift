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
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(2)
        case .loggedIn:
            HomeView()
                .environmentObject(vm)
        case .loggedOut:
            LoginView()
                .environmentObject(vm)
        }
    }
}

#Preview {
    ContentView()
}
