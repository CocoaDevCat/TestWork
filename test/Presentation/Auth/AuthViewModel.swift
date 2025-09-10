//
//  AuthViewModel.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import UIKit

@MainActor
class AuthViewModel: BaseViewModel {
    
    private let authUseCase: AuthUseCaseProtocol
    private let saveTokenUseCase: SaveTokenUseCaseProtocol
    
    init(_ authUseCase: AuthUseCaseProtocol, _ saveTokenUseCase: SaveTokenUseCaseProtocol) {
        self.authUseCase = authUseCase
        self.saveTokenUseCase = saveTokenUseCase
    }
    
    func appleSignIn() {
        AppleUtils.shared.signIn { token in
            self.authUser(token)
        }
    }
    
    func googleSignIn() {
        GoogleUtils.shared.signIn { token in
            self.authUser(token)
        }
    }
    
    private func authUser(_ token: String?) {
        guard let token = token else { return }
        
        Task {
            do {
                let user = try await authUseCase.execute(token)
                
                saveTokenUseCase.execute(user.result.accessToken)
                
                navigateToMain()
            } catch {
                dump(error)
            }
        }
    }
    
    func navigateToMain() {
        DispatchQueue.main.async { [self] in
            router?.navigateTo(.push(ScreenKeys.main))
        }
    }
}
