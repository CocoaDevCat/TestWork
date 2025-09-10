//
//  AuthFactory.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

extension Container {
    
    var authFactory: Factory {
        Factory(self, ScreenKeys.auth) { [self] router, bundle in
            let authUseCase = AuthUseCase(authRepository)
            let saveTokenUseCase = SaveTokenUseCase(authRepository)

            let viewModel = AuthViewModel(authUseCase, saveTokenUseCase)
            
            viewModel.setup(router, bundle)
            
            return AuthScreen(viewModel: viewModel)
        }
    }
}
