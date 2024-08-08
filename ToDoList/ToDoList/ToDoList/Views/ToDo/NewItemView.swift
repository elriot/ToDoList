//
//  NewItemView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct NewItemView: View {
    @StateObject private var vm = NewItemVM()

    var body: some View {
        VStack(spacing: 10) {
             
            Spacer()
            
            TitledTextField(title: "Title", placeholder: "What do you need to do?", text: $vm.newItem.title)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a brief description", text: $vm.newItem.description)
            
            Divider()
            
            StatusMenu(status: $vm.newItem.status)
            
            Divider()
            
            PriorityMenu(priority: $vm.newItem.priority)
            
            Spacer()
            
            CTAButton(title: "Confirm", action: {
                Task {
                    do {
                        try await vm.saveNewItem()
                    } catch {
                        
                    }
                }
            })
        }
        .padding(.horizontal)
    }
}

#Preview {
    NewItemView()
}
