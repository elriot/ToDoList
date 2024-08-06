//
//  CTAButton.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

struct CTAButton: View { // call to action button
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                    
                Text(title)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        }
        .frame(maxHeight: 76)
    }
}

#Preview {
    CTAButton(title: "Confirm") {}
}
