//
//  UserMeDTO.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

import Foundation

struct UserMeModel {
    let id: Int
    let name: String
    
    static func map(_ dto: UserMeDTO) -> UserMeModel {
        return .init(id: dto.id, name: dto.name)
    }
}
