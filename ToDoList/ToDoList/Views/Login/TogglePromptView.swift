//
//  TogglePromptView.swif
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-06.
//

import SwiftUI

struct TogglePromptView: View {
    @Binding var text: String
    @Binding var prompt: String
    @Binding var isLogginIn: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Text(text)
            
            Button(prompt){
                print("toggle views")
                isLogginIn.toggle()
            }
            
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TogglePromptView(text: .constant("Sign up here!"), prompt: .constant("Click Here"), isLogginIn: .constant(true))
}
