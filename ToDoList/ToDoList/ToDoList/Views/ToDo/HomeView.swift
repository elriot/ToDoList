//
//  HomeView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var loginVM: LoginVM
    @StateObject private var vm = ListVM()
    @State private var path: [NavPath] = []
    @State private var showLogout: Bool = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                TabView {
                    ListView(title: Status.todo.rawValue, items: $vm.todoItems, shouldReDraw: $vm.shouldReDraw)
                    
                    ListView(title: Status.inProgress.rawValue, items: $vm.inProgressItems, shouldReDraw: $vm.shouldReDraw)
                    
                    ListView(title: Status.done.rawValue, items: $vm.doneItems, shouldReDraw: $vm.shouldReDraw)
                }
                .tabViewStyle(.page)
            }

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button {
                        showLogout = true
                    } label: {
                        Image(systemName: "person.circle")
                    }
                })
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button {
                        path.append(.newItem)
                    } label: {
                        Image(systemName: "plus")
                    }
                })
            }
            .navigationDestination(for: NavPath.self) { path in
                switch path {
                case .newItem:
                    NewItemView(path: $path)
                case .details(let item):
                    ItemDetailsView(item: item, path: $path)
                }
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
        .onAppear {
            print("onappar!")
            vm.fetchItems()
        }
    }
}

#Preview {
    HomeView()
}
