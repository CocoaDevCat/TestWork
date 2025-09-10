//
//  HomeScreen.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        ZStack {
            Color.veryLight
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        Spacer()
                        
                        SelectСountryView()
                            .padding(.trailing, 30)
                    }
                    
                    HStack {
                        Text("GIFTS")
                            .font(.custom("YFFRARETRIAL-AlphaBlack", size: 62))
                            .foregroundColor(.dark)
                        
                        Spacer()
                        
                        SearchView()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    
                    BannersView()
                    
                    MenuView()
                        .padding(.top, 16)
                    
                    ZStack {
                        Color.white
                            .cornerRadius(16)
                        
                        VStack(alignment: .center, spacing: 0) {
                            ViewAllCategoriesView()
                                .padding(.top, 18)
                            
                            CategoriesView()
                                .padding(.top, 18)

                            ProductsView()
                                .padding(.horizontal, 16)
                                .padding(.top, 16)
                                .padding(.bottom, 8)
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    .padding(.bottom, 8)
                    
                    Spacer()
                }
            }
        }
    }
}
