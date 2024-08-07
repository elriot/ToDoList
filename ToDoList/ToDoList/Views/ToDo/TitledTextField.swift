//
//  TitledTextField.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct TitledTextField: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("\(title):")
                .font(.caption2)
                .foregroundStyle(.secondary)
            
            TextField(placeholder, text: $text, axis: .vertical)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TitledTextField(title: "Title", placeholder: "What do you need to do?", text: .constant(""))
}
