//
//  KeyboardView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct KeyboardView: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack{
            TextField(placeholder, text: $text)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.done)
                .textInputAutocapitalization(.words)
                .keyboardType(.default)
                .background(.clear)
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 0.3)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.background)
                )
            
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    KeyboardView(placeholder: "First Name", text: .constant(""))
}
