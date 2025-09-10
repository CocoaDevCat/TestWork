//
//  SearchView.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(16)
            
            HStack {
                Image(.search)
                
                Text("Search")
                    .foregroundColor(.blueLight)
                    .font(.system(size: 17))
            }
        }
        .frame(width: 110, height: 42)
    }
}
