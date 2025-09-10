//
//  CustomTabBar.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(spacing: 0) {
                Color.separator
                    .frame(height: 0.4)
                
                Spacer()
                
                HStack {
                    ItemTabBar(selectedTab: $selectedTab, "Gifts", .gifts, index: 0)

                    ItemTabBar(selectedTab: $selectedTab, "Gifts", .flowerGifts, index: 1)

                    ItemTabBar(selectedTab: $selectedTab, "Events", .events, index: 2)

                    ItemTabBar(selectedTab: $selectedTab, "Cart", .card, index: 3)

                    ItemTabBar(selectedTab: $selectedTab, "Profile", .profile, index: 4)
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        .frame(height: 70)
    }
}

struct ItemTabBar: View {
    
    @Binding var selectedTab: Int
    
    let title: String
    let icon: ImageResource
    let index: Int
    
    init(selectedTab: Binding<Int>, _ title: String, _ icon: ImageResource, index: Int) {
        self._selectedTab = selectedTab
        
        self.title = title
        self.icon = icon
        
        self.index = index
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                Spacer()

                VStack(alignment: .center, spacing: 4) {
                    Image(icon)
                        .renderingMode(.template)

                    Text(title)
                        .font(.system(size: 12))
                }
                
                Spacer()
            }
            .foregroundColor(selectedTab == index ? .black : .blueLight)
        }
        .onTapGesture {
            selectedTab = index
        }
    }
}
