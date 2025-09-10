//
//  MainScreen.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct MainScreen: View {
    
    @State
    private var selectedTab: Int = 0
    
    var body: some View {
        ZStack {
            VStack {
                Color.veryLight
                    .ignoresSafeArea()
                
                Color.white
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    RouterView(key: .home)
                        .ignoresSafeArea()
                        .toolbar(.hidden, for: .tabBar)
                        .tag(0)
                    
                    RouterView(key: .home)
                        .ignoresSafeArea()
                        .toolbar(.hidden, for: .tabBar)
                        .tag(1)
                    
                    RouterView(key: .home)
                        .ignoresSafeArea()
                        .toolbar(.hidden, for: .tabBar)
                        .tag(2)
                    
                    RouterView(key: .home)
                        .ignoresSafeArea()
                        .toolbar(.hidden, for: .tabBar)
                        .tag(3)
                    
                    RouterView(key: .home)
                        .ignoresSafeArea()
                        .toolbar(.hidden, for: .tabBar)
                        .tag(4)
                }
                .foregroundColor(.blueLight)
                
                CustomTabBar(selectedTab: $selectedTab)
                    .ignoresSafeArea()
            }
        }
    }
}
