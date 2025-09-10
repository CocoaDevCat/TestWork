//
//  RouterView.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct RouterView: UIViewControllerRepresentable {
    
    var key: ScreenKeys
    
    func makeUIViewController(context: Context) -> RouterController {
        return RouterBuilder.create(key)
    }
    
    func updateUIViewController(_ uiViewController: RouterController, context: Context) {
        dump(uiViewController)
    }
}
