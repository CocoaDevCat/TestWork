//
//  UserDTO.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import Foundation

struct UserDTO: Codable {
    let jsonrpc: String
    let result: UserResultDTO
    let id: Int

    enum CodingKeys: String, CodingKey {
        case jsonrpc
        case result
        case id
    }
}
