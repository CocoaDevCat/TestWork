//
//  HomeFactory.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

extension Container {
    
    var mainFactory: Factory {
        Factory(self, ScreenKeys.main) { router, bundle in
            return MainScreen()
        }
    }
}
