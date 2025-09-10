//
//  AuthButton.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct AuthButton: View {
    
    private let title: String
    private let icon: ImageResource
    
    private let tabCallback: () -> Void
    
    init(_ title: String, _ icon: ImageResource, _ tabCallback: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        
        self.tabCallback = tabCallback
    }
    
    var body: some View {
        ZStack {
            Color.white
            
            HStack(spacing: 8) {
                Image(icon)
                
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.black)
            }
        }
        .cornerRadius(10)
        .frame(height: 56)
        .onTapGesture {
            tabCallback()
        }
    }
}
