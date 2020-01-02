//
//  UnderlinedTextField.swift
//  UnderlinedTextField
//
//  Created by Vishnu Ravi on 12/31/19.
//  Copyright © 2019 Vishnu Ravi. All rights reserved.
//

import SwiftUI

struct UnderlinedTextField: View {
    private var text: Binding<String>
    private var placeholder: String
    private var lineThickness: CGFloat
    private var inactiveLineColor: Color
    private var activeLineColor: Color
    @State private var lineColor: Color
    
    init(placeholder: String = "", text: Binding<String>, lineThickness: CGFloat = CGFloat(1.0), inactiveLineColor: Color = Color.gray, activeLineColor: Color = Color.black){
        self.text = text
        self.placeholder = placeholder
        self.lineThickness = lineThickness
        self.inactiveLineColor = inactiveLineColor
        self.activeLineColor = activeLineColor
        _lineColor = State(initialValue: self.inactiveLineColor)
    }
    
    var body: some View {
        VStack{
            TextField(placeholder, text: text, onEditingChanged: { (editingChanged) in
                if editingChanged {
                    self.lineColor = self.activeLineColor
                } else {
                    self.lineColor = self.inactiveLineColor
                }
            })
            Rectangle().frame(height: lineThickness, alignment: .bottom).foregroundColor(lineColor)
        }
    }
}
