//
//  ParamsDTO.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import Foundation

struct ParamsDTO: Codable {
    let fbIDToken: String

    enum CodingKeys: String, CodingKey {
        case fbIDToken
    }
}
