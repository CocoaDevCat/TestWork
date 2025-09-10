//
//  Router.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import Foundation

class RouterBuilder {

    @MainActor
    static func create(_ initial: ScreenKey) -> RouterController {
        let controller = RouterController()
        let router = Router(controller)
                
        router.initialize(initial)
        
        return controller
    }

    
}
