//
//  PasswordToggleField.swift
//  PasswordToggleField
//
//  Created by Vishnu Ravi on 12/31/19.
//  Copyright © 2019 Vishnu Ravi. All rights reserved.
//

import SwiftUI

struct PasswordToggleField: View {
    @State private var passwordHidden: Bool = true
    @State private var passwordIcon: String = "eye.slash"
    private var password: Binding<String>
    private var placeholder: String
    
    init(placeholder: String, text: Binding<String>){
        self.placeholder = placeholder
        self.password = text
    }
    
    var body: some View {
        HStack(){
            if(self.passwordHidden){
                SecureField(placeholder, text: password)
            }else{
                TextField(placeholder, text: password).autocapitalization(.none)
            }
            Button(action: {
                self.passwordHidden.toggle()
                if(self.passwordHidden){
                    self.passwordIcon = "eye.slash"
                }else{
                    self.passwordIcon = "eye"
                }
            }){
                Image(systemName: self.passwordIcon).padding(5)
            }
        }
    }
}