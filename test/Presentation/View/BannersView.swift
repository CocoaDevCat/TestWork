//
//  BannersView.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct BannerItem: View {
    
    var color: Color
    
    var body: some View {
        ZStack {
            color
                .cornerRadius(16)
            
            HStack {
                Spacer()
                
                Image(.banner)
            }
            
            HStack {
                VStack(spacing: 0) {
                    Text("UPCOMING\nHOLIDAYS SOON")
                        .font(.custom("YFFRARETRIAL-AlphaBlack", size: 40))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(18)
                
                Spacer()
            }
            
            HStack {
                VStack(spacing: 0) {
                    Spacer()
                    
                    ZStack {
                        Color.white
                            .frame(width: 118, height: 32)
                            .cornerRadius(16)
                        
                        Text("Call to action")
                            .foregroundColor(.dark)
                            .font(.system(size: 14, weight: .bold))
                    }
                }
                .padding(18)
                
                Spacer()
            }
        }
    }
}

struct BannersView: View {
    var body: some View {
        GeometryReader { geo in
            let cardWidth = geo.size.width * 0.9

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    Spacer()
                        .frame(width: 16)
                    
                    BannerItem(color: .bannerFirst)
                        .frame(width: cardWidth)
                        .cornerRadius(15)
                    
                    Spacer()
                        .frame(width: 4)
                    
                    BannerItem(color: .bannerSecond)
                        .frame(width: cardWidth)
                        .cornerRadius(15)
                    
                    Spacer()
                        .frame(width: 20)
                }
            }
        }
        .frame(height: 150)
    }
}
