//
//  CategoriesView.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct CategoryItem: View {
    
    let title: String
    
    var body: some View {
        HStack(spacing: 6) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.dark)
                .padding(.leading, 12)
            
            Image(.arrowDown)
                .padding(.trailing, 12)
        }
        .frame(height: 32)
        .background(Color.veryLight.cornerRadius(16))
    }
}

struct CategoriesView: View {
    var body: some View {
        HStack(spacing: 6) {
            CategoryItem(title: "Giftboxes")
            
            CategoryItem(title: "For Her")

            CategoryItem(title: "Popular")
        }
    }
}
