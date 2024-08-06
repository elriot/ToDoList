//
//  LoginButton.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct LoginButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
//                    .foregroundColor(
//                        LinearGradient(colors: [.lightGray, .white], startPoint: .leading, endPoint: .trailing)
//                    )
                    
                
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 30, maxHeight: 30)
                    .foregroundColor(.white)
                    .padding(.trailing)
            }
        }
        .background(
            ZStack {
                LinearGradient(colors: [.dullBlue, .lightBlue], startPoint: .leading, endPoint: .trailing)
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 29))
    }
}

#Preview(traits : .sizeThatFitsLayout) {
    LoginButton(title: "Login", action: {})
}
