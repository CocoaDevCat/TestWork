//
//  AuthModel.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

struct UserModel {
    let jsonrpc: String
    let result: UserResultModel
    let id: Int
    
    static func map(_ dto: UserDTO) -> UserModel {
        return .init(
            jsonrpc: dto.jsonrpc,
            result: UserResultModel.map(dto.result),
            id: dto.id
        )
    }
}
