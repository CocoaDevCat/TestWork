//
//  AuthRepository.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import Foundation

protocol AuthRepositoryProtocol {
    func authUser(_ request: AuthDTO) async throws -> UserDTO
}

class AuthRepository: AuthRepositoryProtocol {
    
    private let networkService: NetworkServiceProtocol
    private let keychainService: KeychainServiceProtocol

    init(_ networkService: NetworkServiceProtocol, _ keychainService: KeychainServiceProtocol) {
        self.networkService = networkService
        self.keychainService = keychainService
    }
    
    func authUser(_ request: AuthDTO) async throws -> UserDTO {
        try await networkService.post("/rpc/client", body: request, responseType: UserDTO.self)
    }
    
    func saveToken(_ token: String) {
        keychainService.save(token)
    }
}
