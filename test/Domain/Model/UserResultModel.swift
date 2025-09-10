//
//  ParamsModel.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

struct UserResultModel {
    let accessToken: String
    let me: UserMeModel
    
    static func map(_ dto: UserResultDTO) -> UserResultModel {
        return .init(
            accessToken: dto.accessToken,
            me: UserMeModel.map(dto.me)
        )
    }
}
