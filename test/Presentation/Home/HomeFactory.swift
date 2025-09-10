//
//  HomeFactory.swift
//  test
//
//  Created by Eldar Akkozov on 10/9/25.
//

extension Container {
    
    var homeFactory: Factory {
        Factory(self, ScreenKeys.home) { router, bundle in
            return HomeScreen()
        }
    }
}

