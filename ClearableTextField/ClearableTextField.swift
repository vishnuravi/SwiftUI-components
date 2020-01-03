//
//  ClearableTextField.swift
//  ClearableTextField
//
//  Created by Vishnu Ravi on 12/31/19.
//  Copyright © 2019 Vishnu Ravi. All rights reserved.
//

import SwiftUI

struct ClearableTextField: View {
    @State private var text = ""

    var body: some View {
        TextField("Enter text", text: $text)
            .clearable(text: $text)
    }
}

extension TextField {
    func clearable(text: Binding<String>) -> some View {
        self.modifier(ClearableModifier(text: text))
    }
}

struct ClearableModifier: ViewModifier {
    @Binding var text: String
    
    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if(!text.isEmpty){
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

