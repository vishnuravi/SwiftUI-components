//
//  RefreshableScrollView.swift
//  PulltoRefresh
//
//  Created by Vishnu Ravi on 2/25/20.
//  Copyright © 2020 Vishnu Ravi. All rights reserved.
//

import SwiftUI

struct RefreshableScrollView : UIViewRepresentable {
    
    var width: CGFloat, height: CGFloat
    let modelData = DataModel(modelData: [Model(title: "Episode 1"), Model(title: "Episode 2"), Model(title: "Episode 3")])
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, model: modelData)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action: #selector(Coordinator.handleRefreshControl), for: .valueChanged)
        
        let childView = UIHostingController(rootView: CardList(model: modelData))
        childView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        control.addSubview(childView.view)
        return control
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
    
    class Coordinator: NSObject {
        var control: RefreshableScrollView
        var model: DataModel
        
        init(_ control: RefreshableScrollView, model: DataModel){
            self.control = control
            self.model = model
        }
        
        @objc func handleRefreshControl(sender: UIRefreshControl){
            sender.endRefreshing()
            model.addElement()
        }
    }
}

