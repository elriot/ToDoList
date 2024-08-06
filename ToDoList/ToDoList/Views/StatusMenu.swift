//
//  StatusMenu.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct StatusMenu: View {
    
    @Binding var status: Status
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Status:")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                
                Picker("Statues", selection: $status) {
                    ForEach(Status.allCases, id: \.self) {
                        if $0 == .unknown {
                            EmptyView()
                        } else {
                            Text($0.rawValue)
                        }
                    }
                }
                .pickerStyle(.menu)
            }
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StatusMenu(status: .constant(.todo))
}
