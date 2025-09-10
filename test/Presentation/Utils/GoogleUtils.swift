//
//  GoogleS.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import GoogleSignIn
import UIKit
import FirebaseAuth

class GoogleUtils {
    
    static let shared = GoogleUtils()

    func signIn(_ callback: @escaping (String?) -> Void) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else { return }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if error != nil {
                callback(nil)

                return
            }
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                callback(nil)
                
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if error != nil {
                    callback(nil)
                }
                
                authResult?.user.getIDToken { token, error in
                    callback(token)
                }
            }
        }
    }
}
