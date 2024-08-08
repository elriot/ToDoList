//
//  ItemDetailsView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    @Binding var path: [NavPath]
    @StateObject private var vm = ItemDetailsVM()
    
    var body: some View {
        VStack(spacing: 10) {
            
            TitledTextField(title: "Title", placeholder: "What do you need to do?", text: $vm.updatedItem.title)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a brief description", text: $vm.updatedItem.description)
            
            Divider()
            
            StatusMenu(status: $vm.updatedItem.status)
            
            Divider()
            
            PriorityMenu(priority: $vm.updatedItem.priority)
            
            Spacer()
            
            if vm.initialItem.isDifferent(compareTo: vm.updatedItem) {
                CTAButton(title: "Confirm") {
                    vm.updateItem()
                }
                .alert("Alert", isPresented: $vm.updateItemError){
                    Button("Dismiss", role: .cancel) {}
                } message: {
                    Text("Error updating item.")
                }
                .alert("Success!", isPresented: $vm.didUpdateItem) {
                    Button("Dismiss", role: .cancel) {
                        path.removeLast()
                    }
                } message: {
                    Text("updating item saved successfully.")
                }
            }
            
        }
        .padding(.horizontal)
        .navigationTitle("Details")
        .onAppear {
            vm.initialItem = item
            vm.updatedItem = item
        }
    }
}

#Preview {
    ItemDetailsView(item: Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low), path: .constant([]))
}
