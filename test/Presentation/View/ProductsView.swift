//
//  ProductsView.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct ProductItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(.product)
                .frame(
                    height: (UIScreen.main.bounds.width / 2) - 38
                )
            
            Text("TEDDY PLATFORNM PLATFORNM")
                .foregroundColor(.dark)
                .font(.system(size: 15, weight: .medium))
                .padding(.top, 6)
            
            Text("355 USD")
                .foregroundColor(.dark)
                .font(.system(size: 12, weight: .semibold))
                .padding(.top, 2)
            
            Text("Estimated delivery: 2 days")
                .foregroundColor(.lightGray)
                .font(.system(size: 12))
                .padding(.top, 2)
        }
    }
}

struct ProductsView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 6) {
            ForEach(0 ..< 11) { item in
                ProductItem()
            }
        }
    }
}
