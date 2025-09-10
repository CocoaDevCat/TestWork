//
//  SelectСountryView.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct SelectСountryView: View {
    var body: some View {
        HStack(spacing: 8) {
            Text("Deliver to")
                .foregroundColor(.dark)
                .font(.system(size: 14))
            
            Image(.USA)
            
            HStack(spacing: 4) {
                Text("USA")
                    .foregroundColor(.dark)
                    .font(.system(size: 14))
                
                Image(.arrowDown)
            }
        }
        .frame(height: 44)
    }
}
