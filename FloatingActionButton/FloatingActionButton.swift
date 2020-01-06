//
//  FloatingActionButton.swift
//  FloatingActionButton
//
//  Created by Vishnu Ravi on 1/4/20.
//  Copyright © 2020 Vishnu Ravi. All rights reserved.
//

import SwiftUI

struct FloatingActionButton: View {
    @State private var tasks = ["Task"]
    
    var body: some View {
        ZStack{
            List(self.tasks, id: \.self){ task in
                Text(task)
            }
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        self.tasks.append("Task")
                    }){
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 75, height: 75)
                            .foregroundColor(Color.blue)
                            .shadow(radius: 20)
                    }.padding()
                    
                }
            }
        }
    }
}