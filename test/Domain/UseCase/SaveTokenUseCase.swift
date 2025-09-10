//
//  SaveTokenUseCase.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

protocol SaveTokenUseCaseProtocol {
    func execute(_ token: String)
}

class SaveTokenUseCase: SaveTokenUseCaseProtocol {
    
    private let repository: AuthRepository
    
    init(_ repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(_ token: String) {
        repository.saveToken(token)
    }
}
