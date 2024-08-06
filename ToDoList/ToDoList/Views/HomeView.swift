//
//  HomeView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct HomeView: View {
    
    @State private var vm = ListVM()
    @State private var path: [NavPath] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                TabView {
                    ListView(title: "To Do", items: $vm.todoItems)
                    
                    ListView(title: "In Progress", items: $vm.inProgressItems)
                    
                    ListView(title: "Done", items: $vm.doneItems)
                }
                .tabViewStyle(.page)
            }

            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button {
                        print("Logout")
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
                    NewItemView()
                case .details(let item):
                    ItemDetailsView(item: item)
                }
                
            }
        }

    }
}

#Preview {
    HomeView()
}
