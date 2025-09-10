//
//  Container.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

extension Container {
    var networkService: NetworkServiceProtocol {
        return NetworkService()
    }
    
    var keychainService: KeychainServiceProtocol {
        return KeychainService()
    }
}

extension Container {
    var authRepository: AuthRepository {
        return AuthRepository(networkService, keychainService)
    }
}

extension Container {
    func module() {
        authFactory.register()
        
        mainFactory.register()
        
        homeFactory.register()
    }
}
