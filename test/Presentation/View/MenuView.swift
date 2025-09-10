//
//  MenuView.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct ViewAllCategoriesView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Text("View all categories")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.dark)
        }
        .frame(width: 145, height: 32)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.veryLight, lineWidth: 1)
        )
        
    }
}

struct MenuAll: View {
    var body: some View {
        ZStack(alignment: .center) {
            Text("Show all")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.dark)
        }
        .frame(width: 66)
    }
}

struct MenuItem: View {
    
    let title: String
    let icon: ImageResource
    
    init(_ title: String, _ icon: ImageResource) {
        self.title = title
        self.icon = icon
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(icon)
                .frame(width: 80, height: 80)
                .cornerRadius(12)

            Text(title)
                .multilineTextAlignment(.center)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.black)
                .padding(.top, 5)

            Spacer()
        }
        .frame(width: 100, height: 124)
    }
}

struct MenuView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: 8)
                
                MenuItem("New Popular Arrivals", .menuFirst)
                
                MenuItem("Mixed Flowers", .menuSecond)

                MenuItem("Thank you", .menuThree)

                MenuItem("New Popular Gifts", .menuFour)

                MenuAll()
                
                Spacer()
                    .frame(width: 8)
            }
        }
        .frame(height: 118)
    }
}
