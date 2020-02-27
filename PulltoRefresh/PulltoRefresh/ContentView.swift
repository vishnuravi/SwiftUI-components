//
//  ContentView.swift
//  PulltoRefresh
//
//  Created by Vishnu Ravi on 2/25/20.
//  Copyright © 2020 Vishnu Ravi. All rights reserved.
//

import SwiftUI

struct Model : Identifiable {
    var id = UUID()
    var title: String = ""
}

struct ContentView: View {
    
    var body: some View {
        GeometryReader {
            geometry in
            RefreshableScrollView(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct CardList: View {
    
    @ObservedObject var model: DataModel
    
    var body: some View {
        VStack(){
            ForEach(model.modelData){ item in
                Card(title: item.title)
                    .padding(15)
            }
            Spacer()
        }
    }
}

class DataModel: ObservableObject {
    @Published var modelData: [Model]
    
    init(modelData: [Model]){
        self.modelData = modelData
    }
    
    func addElement(){
        modelData.append(Model(title: "Episode \(modelData.count + 1)"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
