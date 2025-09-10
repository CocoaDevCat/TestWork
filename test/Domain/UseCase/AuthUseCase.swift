//
//  AuthUseCase.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

protocol AuthUseCaseProtocol {
    func execute(_ token: String) async throws -> UserModel
}

class AuthUseCase: AuthUseCaseProtocol {
    
    private let repository: AuthRepositoryProtocol
    
    init(_ repository: AuthRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(_ token: String) async throws -> UserModel {
        let request = AuthDTO(jsonrpc: "2.0", method: "auth.firebaseLogin", params: .init(fbIDToken: token), id: 1)
        
        return UserModel.map(try await repository.authUser(request))
    }
}
