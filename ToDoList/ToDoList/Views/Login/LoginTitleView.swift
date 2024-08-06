//
//  LoginTitleView.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct LoginTitleView: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("ToDoListLogo")
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 3) {
                Text("Please do")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(maxWidth: 175, maxHeight: 0.7)
                    .foregroundColor(.gray)
                
                Text("A better todo list")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxHeight: 110)
        .padding(.horizontal)
    }
}

#Preview {
    LoginTitleView()
}
