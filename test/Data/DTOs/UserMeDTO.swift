//
//  UserMeDTO.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import Foundation

struct UserMeDTO: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
