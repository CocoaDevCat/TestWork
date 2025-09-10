//
//  UserResultDTO.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import Foundation

struct UserResultDTO: Codable {
    let accessToken: String
    let me: UserMeDTO

    enum CodingKeys: String, CodingKey {
        case accessToken
        case me
    }
}
