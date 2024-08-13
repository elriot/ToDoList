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
    @State private var showDeleteAlert: Bool = false
    @StateObject private var detailVM = ItemDetailsVM()
    @StateObject private var deleteVM = DeleteItemVM()
    
    var body: some View {
        VStack(spacing: 10) {
            
            TitledTextField(title: "Title", placeholder: "What do you need to do?", text: $detailVM.updatedItem.title)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a brief description", text: $detailVM.updatedItem.description)
            
            Divider()
            
            StatusMenu(status: $detailVM.updatedItem.status)
            
            Divider()
            
            PriorityMenu(priority: $detailVM.updatedItem.priority)
            
            Spacer()
            
            if detailVM.initialItem.isDifferent(compareTo: detailVM.updatedItem) {
                CTAButton(title: "Confirm") {
                    detailVM.updateItem()
                }
                .alert("Alert", isPresented: $detailVM.updateItemError){
                    Button("Dismiss", role: .cancel) {}
                } message: {
                    Text("Error updating item.")
                }
                .alert("Success!", isPresented: $detailVM.didUpdateItem) {
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
            detailVM.initialItem = item
            detailVM.updatedItem = item
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing, content: {
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
            })
        }
        .confirmationDialog("Delete?", isPresented: $showDeleteAlert){
            Button("Delete", role: .destructive){
                deleteVM.deleteItem(item: item)
            }
            Button("Cancel", role: .cancel){}
        } message: {
            Text("Do you really want to delete this item?")
        }
        .alert("Alert", isPresented: $deleteVM.deleteItemError){
            Button("Dismiss", role: .cancel) {}
        } message: {
            Text("Error deleting item.")
        }
        .alert("Success!", isPresented: $deleteVM.didDelteItem) {
            Button("Dismiss", role: .cancel) {
                path.removeLast()
            }
        } message: {
            Text("updating item saved successfully.")
        }
    }
}

#Preview {
    ItemDetailsView(item: Item(id: "abcd123", authorId: "John Doe", title: "First item", description: "First", startDate: .now, status: .todo, priority: .low), path: .constant([]))
}
