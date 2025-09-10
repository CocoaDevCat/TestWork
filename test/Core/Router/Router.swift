//
//  Router.swift
//  test
//
//  Created by Eldar Akkozov on 9/9/25.
//

import Foundation
import SwiftUI
import UIKit

public class Router {

    var controller: RouterController
    var root: Router?
    
    init(_ controller: RouterController, root: Router? = nil) {
        self.controller = controller
        self.root = root
    }

    @MainActor
    func initialize(_ key: ScreenKey) {
        let module = module(key)

        if let module = module {
            controller.push(module)
        }
    }
        
    @MainActor
    func navigateTo(_ type: RouteType, _ bundle: BundleData? = nil) {
        switch type {
        case .pop:
            controller.pop()
        case .push(let to):
            if let module = module(to, bundle) {
                controller.push(module)
            }
        case .set(let to):
            if let module = module(to, bundle) {
                controller.set(module)
            }
        case .present(let to):
            if let module = module(to, bundle) {
                controller.present(module)
            }
        case .remove(let key):
            controller.remove(key)
        }
    }

    @MainActor
    private func module(_ key: ScreenKey, _ bundle: BundleData? = nil) -> BaseController? {
        guard let factory = Container.shared.getFactory(key) else { return nil }
        
        let module = factory.resolve(self, bundle)
        
        return BaseController(rootView: module, key)
    }
}
