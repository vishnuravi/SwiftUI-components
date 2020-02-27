//
//  Card.swift
//  PulltoRefresh
//
//  Created by Vishnu Ravi on 2/25/20.
//  Copyright © 2020 Vishnu Ravi. All rights reserved.
//

import SwiftUI

struct Card : View {
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(.primary)
        }
        .padding(30)
        .background(Color.gray)
        .cornerRadius(15)
    }
}
