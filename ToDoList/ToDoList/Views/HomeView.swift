//
//  HomeView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct HomeView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack {
            TabView {
                Text("Page1")
                
                Text("page 2")
                
                Text("page 3")
            }
            .tabViewStyle(.page)
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
                        print("Navigato to new item")
                    } label: {
                        Image(systemName: "plus")
                    }
                })
            }
            .navigationDestination(for: String.self) { _ in
                Text("New View Here")
                
            }
        }

    }
}

#Preview {
    HomeView()
}
