//
//  Untitled.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import Foundation

struct AuthDTO: Codable {
    let jsonrpc: String
    let method: String
    let params: ParamsDTO
    let id: Int

    enum CodingKeys: String, CodingKey {
        case jsonrpc
        case method
        case params
        case id
    }
}

