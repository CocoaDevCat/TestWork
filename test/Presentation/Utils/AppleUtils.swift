//
//  AppleUtils.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import AuthenticationServices
import FirebaseAuth
import UIKit
import CryptoKit

class AppleUtils: NSObject {
    
    private var callback: ((String?) -> Void)?
    private var currentNonce: String?
    
    static let shared = AppleUtils()
    
    func signIn(_ callback: @escaping (String?) -> Void) {
        self.callback = callback
        
        let nonce = randomNonceString()
        currentNonce = nonce
        
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        DispatchQueue.main.async {
            let controller = ASAuthorizationController(authorizationRequests: [request])
            controller.delegate = self
            controller.presentationContextProvider = self
            controller.performRequests()
        }
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    return .min
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}

extension AppleUtils: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            callback?(nil)
            
            return
        }
        
        guard let nonce = currentNonce else {
            callback?(nil)
            
            return
        }
        
        guard let appleIDToken = appleIDCredential.identityToken,
              let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
            callback?(nil)
            
            return
        }
        
        let credential = OAuthProvider.credential(
            providerID: .apple,
            idToken: idTokenString,
            rawNonce: nonce
        )
        
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            if error != nil {
                self?.callback?(nil)

                return
            }
            
            authResult?.user.getIDToken { [weak self] idToken, error in
                if error != nil {
                    self?.callback?(nil)
                    return
                }
                
                self?.callback?(idToken)
                self?.currentNonce = nil
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        callback?(nil)
        currentNonce = nil
    }
}

extension AppleUtils: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        if let windowScene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }),
           let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
            return keyWindow
        }
        
        if let window = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow }) {
            return window
        }
        
        return UIWindow()
    }
}

