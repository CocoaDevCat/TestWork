//
//  TermsText.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import SwiftUI

struct TermsText: View {
    var body: some View {
        var termsText = AttributedString("By continuing, you agree to Assetsy’s\nTerms of Use and Privacy Policy")
        
        if let range = termsText.range(of: "Terms of Use") {
            if let url = URL(string: "https://www.yourwebsite.com/terms") {
                termsText[range].link = url
            }
            
            termsText[range].foregroundColor = .darkBlue
            termsText[range].underlineStyle = .single
        }
        
        if let range = termsText.range(of: "Privacy Policy") {
            if let url = URL(string: "https://www.yourwebsite.com/privacy") {
                termsText[range].link = url
            }
            
            termsText[range].foregroundColor = .darkBlue
            termsText[range].underlineStyle = .single
        }
        
        return Text(termsText)
            .font(.system(size: 11))
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
            .font(.body)
            .padding()
    }
}
