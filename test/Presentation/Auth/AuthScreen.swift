//
//  AuthView.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import SwiftUI

struct AuthScreen: View {
    
    @StateObject
    var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Image(.ribbon)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            
            Image(.flower)
                        
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    
                    Text("Skip")
                        .font(.system(size: 17))
                        .foregroundColor(.dark)
                        .frame(width: 66, height: 44)
                        .onTapGesture {
                            viewModel.navigateToMain()
                        }
                }
                
                HStack {
                    Text("WELCOME")
                        .font(.custom("YFFRARETRIAL-AlphaBlack", size: 62))
                        .foregroundColor(.dark)
                    
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 10)
                
                Text("Enter your phone number. We will send you an SMS with a confirmation code to this number.")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                    .lineSpacing(4)
                    .foregroundColor(.lightGray)
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                
                
                Spacer()
                
                AuthButton("Continue with Apple", .apple) {
                    viewModel.appleSignIn()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
                
                AuthButton("Continue with Google", .google) {
                    viewModel.googleSignIn()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
                    
                TermsText()
                    .padding(.bottom, 20)
                
            }
        }
        .background(.veryLight)
    }
}
